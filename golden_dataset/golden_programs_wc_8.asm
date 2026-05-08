; DESCRIPTION: This GeOS assembly code counts the number of characters, lines, and words in a predefined text buffer stored at 0x6000. The results are stored in RAM addresses 0x7800, 0x7801, and 0x7802 respectively for characters, lines, and words.

; wc.asm -- Word count utility
;
; Counts characters, lines, and words in a text buffer stored in RAM.
; Text is pre-loaded at 0x6000 using STRO.
; Results stored at RAM[0x7800] (chars), RAM[0x7801] (lines), RAM[0x7802] (words).
;
; Sample text: "Hello World\nFoo Bar\nBaz" = 23 chars, 2 lines, 5 words

    ; --- Fill screen ---
    LDI r8, 0x000011
    FILL r8

    ; --- Pre-load sample text at 0x6000 ---
    ; We write char by char to have full control
    ; "Hello World\nFoo Bar\nBaz\0"
    LDI r20, 0x6000
    STRO r20, "Hello World"
    ; r20 is still 0x6000, STRO doesn't advance r20
    ; We need to manually advance
    LDI r11, 1
    LDI r20, 0x600C        ; after "Hello World" + null = 0x6000+12
    LDI r0, 10             ; newline
    STORE r20, r0
    ADD r20, r11
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
    LDI r0, 10             ; newline
    STORE r20, r0
    ; continue at 0x600C
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    ; null at 0x6013, replace with newline
    LDI r20, 0x6013
    LDI r0, 10
    STORE r20, r0
    ; continue at 0x6014
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Count characters, lines, words ---
    LDI r7, 0x6000        ; text pointer
    LDI r12, 0             ; char count
    LDI r15, 0             ; line count
    LDI r1, 0             ; word count
    LDI r14, 1             ; prev_was_space (start true)

count_loop:
    LOAD r0, r7           ; read char
    LDI r6, 0
    CMP r0, r6
    JZ r4, count_done

    ; char count++
    ADDI r12, 1

    ; Is it whitespace?
    LDI r6, 32
    CMP r0, r6
    JZ r4, is_space
    LDI r6, 10
    CMP r0, r6
    JZ r4, is_newline

    ; Non-whitespace: check if new word
    LDI r6, 1
    CMP r14, r6
    JNZ r4, not_new_word  ; if prev was NOT space, not a new word
    ADDI r1, 1            ; word count++
not_new_word:
    LDI r14, 0             ; prev_was_space = 0
    JMP next_char

is_space:
    LDI r14, 1
    JMP next_char

is_newline:
    ADDI r15, 1            ; line count++
    LDI r14, 1
    JMP next_char

next_char:
    ADDI r7, 1
    JMP count_loop

count_done:
    ; Store results
    LDI r5, 0x7800
    STORE r5, r12          ; chars

    LDI r5, 0x7801
    STORE r5, r15          ; lines

    LDI r5, 0x7802
    STORE r5, r1          ; words

    ; --- Draw header ---
    LDI r8, 0x660000
    LDI r13, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r13, r16, r17, r18, r8

    LDI r20, 0x5000
    STRO r20, "Word Count"
    LDI r7, 4
    LDI r12, 2
    LDI r15, 0x5000
    LDI r1, 0xFFFFFF
    LDI r14, 0x660000
    DRAWTEXT r7, r12, r15, r1, r14

    ; Display labels
    LDI r20, 0x5000
    STRO r20, "Chars:"
    LDI r7, 4
    LDI r12, 20
    LDI r15, 0x5000
    LDI r1, 0xCCCCCC
    LDI r14, 0x000011
    DRAWTEXT r7, r12, r15, r1, r14

    LDI r20, 0x5000
    STRO r20, "Lines:"
    LDI r7, 4
    LDI r12, 36
    LDI r15, 0x5000
    LDI r1, 0xCCCCCC
    LDI r14, 0x000011
    DRAWTEXT r7, r12, r15, r1, r14

    LDI r20, 0x5000
    STRO r20, "Words:"
    LDI r7, 4
    LDI r12, 52
    LDI r15, 0x5000
    LDI r1, 0xCCCCCC
    LDI r14, 0x000011
    DRAWTEXT r7, r12, r15, r1, r14

    HALT
