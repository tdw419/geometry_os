; DESCRIPTION: Renders a magenta box of size 19x94 starting at (271, 99).
; PLAN: r0=271(x), r1=99(y), r2=19(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 99
LDI r2, 19
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
