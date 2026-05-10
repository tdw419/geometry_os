; DESCRIPTION: Places a orange 43x58 box at position (291, 105).
; PLAN: r0=291(x), r1=105(y), r2=43(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 105
LDI r2, 43
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
