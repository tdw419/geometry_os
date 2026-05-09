; DESCRIPTION: Composite: Places a orange 53x67 rectangle at position (272, 4) then Places a black dot at position (109, 86).
; PLAN: r0=272(x), r1=4(y), r2=53(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x), r6=86(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 4
LDI r2, 53
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 86
LDI r7, 0x000000
PSET r5, r6, r7
HALT
