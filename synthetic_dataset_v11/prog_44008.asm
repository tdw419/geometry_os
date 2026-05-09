; DESCRIPTION: Renders a blue box of size 93x33 starting at (68, 97).
; PLAN: r0=68(x), r1=97(y), r2=93(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 97
LDI r2, 93
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
