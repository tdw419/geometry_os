; DESCRIPTION: Renders a magenta box of size 94x88 starting at (127, 78).
; PLAN: r0=127(x), r1=78(y), r2=94(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 78
LDI r2, 94
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
