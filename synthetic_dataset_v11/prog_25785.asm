; DESCRIPTION: Renders a magenta box of size 91x81 starting at (70, 22).
; PLAN: r0=70(x), r1=22(y), r2=91(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 22
LDI r2, 91
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
