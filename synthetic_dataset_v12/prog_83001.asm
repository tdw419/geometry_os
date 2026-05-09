; DESCRIPTION: Renders a magenta box of size 23x90 starting at (136, 23).
; PLAN: r0=136(x), r1=23(y), r2=23(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 23
LDI r2, 23
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
