; DESCRIPTION: Renders a magenta box of size 21x19 starting at (196, 216).
; PLAN: r0=196(x), r1=216(y), r2=21(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 216
LDI r2, 21
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
