; DESCRIPTION: Renders a blue box of size 21x108 starting at (175, 101).
; PLAN: r0=175(x), r1=101(y), r2=21(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 101
LDI r2, 21
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
