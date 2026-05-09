; DESCRIPTION: Renders a blue box of size 62x110 starting at (300, 30).
; PLAN: r0=300(x), r1=30(y), r2=62(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 30
LDI r2, 62
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
