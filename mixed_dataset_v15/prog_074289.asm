; DESCRIPTION: Creates a green filled rectangle of size 25x23 starting at (55, 136).
; PLAN: r0=55(x), r1=136(y), r2=25(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 136
LDI r2, 25
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
