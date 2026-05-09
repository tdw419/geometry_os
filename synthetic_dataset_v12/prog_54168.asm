; DESCRIPTION: Renders a magenta box of size 92x78 starting at (106, 163).
; PLAN: r0=106(x), r1=163(y), r2=92(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 163
LDI r2, 92
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
