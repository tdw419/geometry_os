; DESCRIPTION: Creates a blue rectangular region at (139, 164) spanning 48 by 37 pixels.
; PLAN: r0=139(x), r1=164(y), r2=48(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 164
LDI r2, 48
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
