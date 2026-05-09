; DESCRIPTION: Renders a purple box of size 88x23 starting at (417, 146).
; PLAN: r0=417(x), r1=146(y), r2=88(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 146
LDI r2, 88
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
