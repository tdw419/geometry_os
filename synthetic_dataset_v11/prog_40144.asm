; DESCRIPTION: Renders a blue box of size 108x80 starting at (87, 49).
; PLAN: r0=87(x), r1=49(y), r2=108(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 49
LDI r2, 108
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
