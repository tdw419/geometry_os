; DESCRIPTION: Creates a blue rectangular region at (139, 19) spanning 48 by 43 pixels.
; PLAN: r0=139(x), r1=19(y), r2=48(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 19
LDI r2, 48
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
