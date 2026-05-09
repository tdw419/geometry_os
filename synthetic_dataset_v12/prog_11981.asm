; DESCRIPTION: Renders a magenta box of size 56x46 starting at (75, 88).
; PLAN: r0=75(x), r1=88(y), r2=56(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 88
LDI r2, 56
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
