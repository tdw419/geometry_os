; DESCRIPTION: Renders a purple box of size 37x54 starting at (27, 191).
; PLAN: r0=27(x), r1=191(y), r2=37(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 191
LDI r2, 37
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
