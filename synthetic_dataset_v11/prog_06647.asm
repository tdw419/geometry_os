; DESCRIPTION: Places a black 105x78 rectangle at position (8, 160).
; PLAN: r0=8(x), r1=160(y), r2=105(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 160
LDI r2, 105
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
