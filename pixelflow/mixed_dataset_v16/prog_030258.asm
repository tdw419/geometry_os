; DESCRIPTION: Places a yellow 86x39 box at position (97, 45).
; PLAN: r0=97(x), r1=45(y), r2=86(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 45
LDI r2, 86
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
