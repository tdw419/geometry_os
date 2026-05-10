; DESCRIPTION: Places a orange 23x52 rectangle at position (112, 58).
; PLAN: r0=112(x), r1=58(y), r2=23(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 58
LDI r2, 23
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
