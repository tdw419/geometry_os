; DESCRIPTION: Renders a magenta box of size 15x84 starting at (175, 3).
; PLAN: r0=175(x), r1=3(y), r2=15(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 3
LDI r2, 15
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
