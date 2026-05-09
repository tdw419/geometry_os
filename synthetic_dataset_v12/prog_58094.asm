; DESCRIPTION: Renders a magenta box of size 15x75 starting at (451, 134).
; PLAN: r0=451(x), r1=134(y), r2=15(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 134
LDI r2, 15
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
