; DESCRIPTION: Renders a blue box of size 108x17 starting at (300, 15).
; PLAN: r0=300(x), r1=15(y), r2=108(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 15
LDI r2, 108
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
