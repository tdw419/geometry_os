; DESCRIPTION: Renders a purple box of size 21x62 starting at (37, 55).
; PLAN: r0=37(x), r1=55(y), r2=21(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 55
LDI r2, 21
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
