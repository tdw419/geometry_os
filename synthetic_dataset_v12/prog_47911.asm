; DESCRIPTION: Renders a green box of size 114x71 starting at (135, 145).
; PLAN: r0=135(x), r1=145(y), r2=114(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 145
LDI r2, 114
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
