; DESCRIPTION: Places a orange 68x112 box at position (165, 158).
; PLAN: r0=165(x), r1=158(y), r2=68(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 158
LDI r2, 68
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
