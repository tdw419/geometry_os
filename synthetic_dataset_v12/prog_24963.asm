; DESCRIPTION: Renders a green box of size 114x81 starting at (127, 49).
; PLAN: r0=127(x), r1=49(y), r2=114(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 49
LDI r2, 114
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
