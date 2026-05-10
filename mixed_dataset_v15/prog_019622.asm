; DESCRIPTION: Places a orange 36x112 box at position (49, 136).
; PLAN: r0=49(x), r1=136(y), r2=36(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 136
LDI r2, 36
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
