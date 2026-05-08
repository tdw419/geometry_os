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
    LDI r5, 0x000011
    FILL r5

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
    LDI r2, 0x6000        ; text pointer
    LDI r0, 0             ; match count
    LDI r7, 1

search_loop:
    ; Read char at text pointer
    LOAD r13, r2
    ; Check for null (end of text)
    LDI r6, 0
    CMP r13, r6
    JZ r1, search_done

    ; Try to match pattern at this position
    LDI r4, 0x6100        ; pattern pointer
    MOV r16, r2            ; save start position

match_try:
    ; Read pattern char
    LOAD r13, r4
    ; If pattern char is null, full match
    LDI r6, 0
    CMP r13, r6
    JZ r1, found_match

    ; Read text char at current position
    LOAD r12, r16
    ; If text is null or newline, no match
    LDI r6, 0
    CMP r12, r6
    JZ r1, no_match

    ; Compare
    CMP r13, r12
    JNZ r1, no_match

    ; Match so far, advance both
    ADD r4, r7
    ADD r16, r7
    JMP match_try

found_match:
    ADDI r0, 1            ; match count++

no_match:
    ADDI r2, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r15, 0x7800
    STORE r15, r0

    ; --- Draw header ---
    LDI r5, 0x006600       ; green header
    LDI r4, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r4, r16, r17, r18, r5

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r2, 4
    LDI r0, 2
    LDI r9, 0x5000
    LDI r8, 0xFFFFFF
    LDI r10, 0x006600
    DRAWTEXT r2, r0, r9, r8, r10

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r2, 4
    LDI r0, 16
    LDI r9, 0x5000
    LDI r8, 0xCCCCCC
    LDI r10, 0x000011
    DRAWTEXT r2, r0, r9, r8, r10

    ; Show the pattern itself
    LDI r2, 80
    LDI r0, 16
    LDI r9, 0x6100
    LDI r8, 0xFFFF00     ; yellow
    LDI r10, 0x000011
    DRAWTEXT r2, r0, r9, r8, r10

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r2, 4
    LDI r0, 32
    LDI r9, 0x5000
    LDI r8, 0xCCCCCC
    LDI r10, 0x000011
    DRAWTEXT r2, r0, r9, r8, r10

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r2, 4
    LDI r0, 48
    LDI r9, 0x5000
    LDI r8, 0xCCCCCC
    LDI r10, 0x000011
    DRAWTEXT r2, r0, r9, r8, r10

    LDI r2, 50
    LDI r0, 48
    LDI r9, 0x6000
    LDI r8, 0x888888
    LDI r10, 0x000011
    DRAWTEXT r2, r0, r9, r8, r10

    HALT
