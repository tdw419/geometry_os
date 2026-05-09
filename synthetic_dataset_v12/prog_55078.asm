; DESCRIPTION: Renders a purple box of size 39x62 starting at (71, 142).
; PLAN: r0=71(x), r1=142(y), r2=39(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 142
LDI r2, 39
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
