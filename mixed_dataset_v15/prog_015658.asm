; DESCRIPTION: Places a orange 21x94 box at position (88, 15).
; PLAN: r0=88(x), r1=15(y), r2=21(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 15
LDI r2, 21
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
