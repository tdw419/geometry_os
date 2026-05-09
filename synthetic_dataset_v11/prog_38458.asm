; DESCRIPTION: Creates a blue rectangular region at (4, 16) spanning 119 by 18 pixels.
; PLAN: r0=4(x), r1=16(y), r2=119(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 16
LDI r2, 119
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
