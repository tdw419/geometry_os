; DESCRIPTION: Places a orange 23x112 rectangle at position (463, 101).
; PLAN: r0=463(x), r1=101(y), r2=23(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 101
LDI r2, 23
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
