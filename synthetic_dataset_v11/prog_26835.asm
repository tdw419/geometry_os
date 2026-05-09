; DESCRIPTION: Renders a blue box of size 12x17 starting at (14, 86).
; PLAN: r0=14(x), r1=86(y), r2=12(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 86
LDI r2, 12
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
