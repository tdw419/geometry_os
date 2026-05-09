; DESCRIPTION: Renders a blue box of size 65x97 starting at (175, 96).
; PLAN: r0=175(x), r1=96(y), r2=65(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 96
LDI r2, 65
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
