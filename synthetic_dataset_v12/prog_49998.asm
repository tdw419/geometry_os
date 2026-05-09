; DESCRIPTION: Renders a blue box of size 65x26 starting at (237, 17).
; PLAN: r0=237(x), r1=17(y), r2=65(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 17
LDI r2, 65
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
