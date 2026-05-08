; DESCRIPTION: This GeOS assembly code counts the number of characters, lines, and words in a predefined text buffer stored at 0x6000. The results are stored in RAM addresses 0x7800, 0x7801, and 0x7802 respectively for characters, lines, and words.

; wc.asm -- Word count utility
;
; Counts characters, lines, and words in a text buffer stored in RAM.
; Text is pre-loaded at 0x6000 using STRO.
; Results stored at RAM[0x7800] (chars), RAM[0x7801] (lines), RAM[0x7802] (words).
;
; Sample text: "Hello World\nFoo Bar\nBaz" = 23 chars, 2 lines, 5 words

    ; --- Fill screen ---
    LDI r5, 0x000011
    FILL r5

    ; --- Pre-load sample text at 0x6000 ---
    ; We write char by char to have full control
    ; "Hello World\nFoo Bar\nBaz\0"
    LDI r20, 0x6000
    STRO r20, "Hello World"
    ; r20 is still 0x6000, STRO doesn't advance r20
    ; We need to manually advance
    LDI r9, 1
    LDI r20, 0x600C        ; after "Hello World" + null = 0x6000+12
    LDI r7, 10             ; newline
    STORE r20, r7
    ADD r20, r9
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
    LDI r7, 10             ; newline
    STORE r20, r7
    ; continue at 0x600C
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    ; null at 0x6013, replace with newline
    LDI r20, 0x6013
    LDI r7, 10
    STORE r20, r7
    ; continue at 0x6014
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Count characters, lines, words ---
    LDI r11, 0x6000        ; text pointer
    LDI r12, 0             ; char count
    LDI r2, 0             ; line count
    LDI r8, 0             ; word count
    LDI r0, 1             ; prev_was_space (start true)

count_loop:
    LOAD r7, r11           ; read char
    LDI r3, 0
    CMP r7, r3
    JZ r10, count_done

    ; char count++
    ADDI r12, 1

    ; Is it whitespace?
    LDI r3, 32
    CMP r7, r3
    JZ r10, is_space
    LDI r3, 10
    CMP r7, r3
    JZ r10, is_newline

    ; Non-whitespace: check if new word
    LDI r3, 1
    CMP r0, r3
    JNZ r10, not_new_word  ; if prev was NOT space, not a new word
    ADDI r8, 1            ; word count++
not_new_word:
    LDI r0, 0             ; prev_was_space = 0
    JMP next_char

is_space:
    LDI r0, 1
    JMP next_char

is_newline:
    ADDI r2, 1            ; line count++
    LDI r0, 1
    JMP next_char

next_char:
    ADDI r11, 1
    JMP count_loop

count_done:
    ; Store results
    LDI r13, 0x7800
    STORE r13, r12          ; chars

    LDI r13, 0x7801
    STORE r13, r2          ; lines

    LDI r13, 0x7802
    STORE r13, r8          ; words

    ; --- Draw header ---
    LDI r5, 0x660000
    LDI r15, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r15, r16, r17, r18, r5

    LDI r20, 0x5000
    STRO r20, "Word Count"
    LDI r11, 4
    LDI r12, 2
    LDI r2, 0x5000
    LDI r8, 0xFFFFFF
    LDI r0, 0x660000
    DRAWTEXT r11, r12, r2, r8, r0

    ; Display labels
    LDI r20, 0x5000
    STRO r20, "Chars:"
    LDI r11, 4
    LDI r12, 20
    LDI r2, 0x5000
    LDI r8, 0xCCCCCC
    LDI r0, 0x000011
    DRAWTEXT r11, r12, r2, r8, r0

    LDI r20, 0x5000
    STRO r20, "Lines:"
    LDI r11, 4
    LDI r12, 36
    LDI r2, 0x5000
    LDI r8, 0xCCCCCC
    LDI r0, 0x000011
    DRAWTEXT r11, r12, r2, r8, r0

    LDI r20, 0x5000
    STRO r20, "Words:"
    LDI r11, 4
    LDI r12, 52
    LDI r2, 0x5000
    LDI r8, 0xCCCCCC
    LDI r0, 0x000011
    DRAWTEXT r11, r12, r2, r8, r0

    HALT
