; DESCRIPTION: Renders a green box of size 94x114 starting at (99, 94).
; PLAN: r0=99(x), r1=94(y), r2=94(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 94
LDI r2, 94
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
