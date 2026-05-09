; DESCRIPTION: Renders a purple box of size 76x62 starting at (278, 142).
; PLAN: r0=278(x), r1=142(y), r2=76(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 142
LDI r2, 76
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
