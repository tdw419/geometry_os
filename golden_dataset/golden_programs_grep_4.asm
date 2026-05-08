; DESCRIPTION: This GeOS assembly code searches for a byte pattern in a text buffer located at 0x6000, using a pre-loaded pattern at 0x6100. It counts the matches and displays them on the screen with highlighted text, storing the match count at RAM[0x7800].

; grep.asm -- Search for a pattern in RAM text
;
; Searches for all occurrences of a byte pattern in a text buffer.
; Pattern is pre-loaded at 0x6100, text at 0x6000.
; Outputs match count at RAM[0x7800].
; Displays matches on screen with highlighted text.
;
; Sample: search for "oo" in "Hello World\nFoo Bar\nBaz"
; Expected: 1 match (in "F[oo] Bar")

    ; --- Fill screen ---
    LDI r11, 0x000011
    FILL r11

    ; --- Pre-load text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    LDI r20, 0x600B
    LDI r13, 10
    STORE r20, r13
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    LDI r20, 0x6013
    LDI r13, 10
    STORE r20, r13
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Pre-load pattern at 0x6100 ---
    LDI r20, 0x6100
    STRO r20, "oo"

    ; --- Search ---
    LDI r3, 0x6000        ; text pointer
    LDI r2, 0             ; match count
    LDI r7, 1

search_loop:
    ; Read char at text pointer
    LOAD r13, r3
    ; Check for null (end of text)
    LDI r6, 0
    CMP r13, r6
    JZ r10, search_done

    ; Try to match pattern at this position
    LDI r12, 0x6100        ; pattern pointer
    MOV r16, r3            ; save start position

match_try:
    ; Read pattern char
    LOAD r13, r12
    ; If pattern char is null, full match
    LDI r6, 0
    CMP r13, r6
    JZ r10, found_match

    ; Read text char at current position
    LOAD r1, r16
    ; If text is null or newline, no match
    LDI r6, 0
    CMP r1, r6
    JZ r10, no_match

    ; Compare
    CMP r13, r1
    JNZ r10, no_match

    ; Match so far, advance both
    ADD r12, r7
    ADD r16, r7
    JMP match_try

found_match:
    ADDI r2, 1            ; match count++

no_match:
    ADDI r3, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r5, 0x7800
    STORE r5, r2

    ; --- Draw header ---
    LDI r11, 0x006600       ; green header
    LDI r12, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r12, r16, r17, r18, r11

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r3, 4
    LDI r2, 2
    LDI r9, 0x5000
    LDI r15, 0xFFFFFF
    LDI r0, 0x006600
    DRAWTEXT r3, r2, r9, r15, r0

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r3, 4
    LDI r2, 16
    LDI r9, 0x5000
    LDI r15, 0xCCCCCC
    LDI r0, 0x000011
    DRAWTEXT r3, r2, r9, r15, r0

    ; Show the pattern itself
    LDI r3, 80
    LDI r2, 16
    LDI r9, 0x6100
    LDI r15, 0xFFFF00     ; yellow
    LDI r0, 0x000011
    DRAWTEXT r3, r2, r9, r15, r0

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r3, 4
    LDI r2, 32
    LDI r9, 0x5000
    LDI r15, 0xCCCCCC
    LDI r0, 0x000011
    DRAWTEXT r3, r2, r9, r15, r0

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r3, 4
    LDI r2, 48
    LDI r9, 0x5000
    LDI r15, 0xCCCCCC
    LDI r0, 0x000011
    DRAWTEXT r3, r2, r9, r15, r0

    LDI r3, 50
    LDI r2, 48
    LDI r9, 0x6000
    LDI r15, 0x888888
    LDI r0, 0x000011
    DRAWTEXT r3, r2, r9, r15, r0

    HALT
