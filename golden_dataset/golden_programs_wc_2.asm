; DESCRIPTION: This GeOS assembly code counts the number of characters, lines, and words in a predefined text buffer stored at 0x6000. The results are stored in RAM addresses 0x7800, 0x7801, and 0x7802 respectively for characters, lines, and words.

; wc.asm -- Word count utility
;
; Counts characters, lines, and words in a text buffer stored in RAM.
; Text is pre-loaded at 0x6000 using STRO.
; Results stored at RAM[0x7800] (chars), RAM[0x7801] (lines), RAM[0x7802] (words).
;
; Sample text: "Hello World\nFoo Bar\nBaz" = 23 chars, 2 lines, 5 words

    ; --- Fill screen ---
    LDI r14, 0x000011
    FILL r14

    ; --- Pre-load sample text at 0x6000 ---
    ; We write char by char to have full control
    ; "Hello World\nFoo Bar\nBaz\0"
    LDI r20, 0x6000
    STRO r20, "Hello World"
    ; r20 is still 0x6000, STRO doesn't advance r20
    ; We need to manually advance
    LDI r6, 1
    LDI r20, 0x600C        ; after "Hello World" + null = 0x6000+12
    LDI r5, 10             ; newline
    STORE r20, r5
    ADD r20, r6
    STRO r20, "Foo Bar"
    LDI r20, 0x601A        ; 0x600C + 1 + 7 + null = 0x600C+9 = 0x6015... hmm
    ; Let me just build the whole thing at once
    ; Actually STRO writes N chars + null. "Hello World" = 11 chars, writes to 0x6000-0x600A, null at 0x600B
    ; So after STRO, next write should be at 0x600C to overwrite the null with newline

    ; --- Redo: build text properly ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    ; null at 0x600B, replace with newline
    LDI r20, 0x600B
    LDI r5, 10             ; newline
    STORE r20, r5
    ; continue at 0x600C
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    ; null at 0x6013, replace with newline
    LDI r20, 0x6013
    LDI r5, 10
    STORE r20, r5
    ; continue at 0x6014
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Count characters, lines, words ---
    LDI r3, 0x6000        ; text pointer
    LDI r2, 0             ; char count
    LDI r4, 0             ; line count
    LDI r13, 0             ; word count
    LDI r7, 1             ; prev_was_space (start true)

count_loop:
    LOAD r5, r3           ; read char
    LDI r11, 0
    CMP r5, r11
    JZ r1, count_done

    ; char count++
    ADDI r2, 1

    ; Is it whitespace?
    LDI r11, 32
    CMP r5, r11
    JZ r1, is_space
    LDI r11, 10
    CMP r5, r11
    JZ r1, is_newline

    ; Non-whitespace: check if new word
    LDI r11, 1
    CMP r7, r11
    JNZ r1, not_new_word  ; if prev was NOT space, not a new word
    ADDI r13, 1            ; word count++
not_new_word:
    LDI r7, 0             ; prev_was_space = 0
    JMP next_char

is_space:
    LDI r7, 1
    JMP next_char

is_newline:
    ADDI r4, 1            ; line count++
    LDI r7, 1
    JMP next_char

next_char:
    ADDI r3, 1
    JMP count_loop

count_done:
    ; Store results
    LDI r0, 0x7800
    STORE r0, r2          ; chars

    LDI r0, 0x7801
    STORE r0, r4          ; lines

    LDI r0, 0x7802
    STORE r0, r13          ; words

    ; --- Draw header ---
    LDI r14, 0x660000
    LDI r12, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r12, r16, r17, r18, r14

    LDI r20, 0x5000
    STRO r20, "Word Count"
    LDI r3, 4
    LDI r2, 2
    LDI r4, 0x5000
    LDI r13, 0xFFFFFF
    LDI r7, 0x660000
    DRAWTEXT r3, r2, r4, r13, r7

    ; Display labels
    LDI r20, 0x5000
    STRO r20, "Chars:"
    LDI r3, 4
    LDI r2, 20
    LDI r4, 0x5000
    LDI r13, 0xCCCCCC
    LDI r7, 0x000011
    DRAWTEXT r3, r2, r4, r13, r7

    LDI r20, 0x5000
    STRO r20, "Lines:"
    LDI r3, 4
    LDI r2, 36
    LDI r4, 0x5000
    LDI r13, 0xCCCCCC
    LDI r7, 0x000011
    DRAWTEXT r3, r2, r4, r13, r7

    LDI r20, 0x5000
    STRO r20, "Words:"
    LDI r3, 4
    LDI r2, 52
    LDI r4, 0x5000
    LDI r13, 0xCCCCCC
    LDI r7, 0x000011
    DRAWTEXT r3, r2, r4, r13, r7

    HALT
