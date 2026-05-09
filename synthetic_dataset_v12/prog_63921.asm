; DESCRIPTION: Creates a blue rectangular region at (310, 68) spanning 48 by 66 pixels.
; PLAN: r0=310(x), r1=68(y), r2=48(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 68
LDI r2, 48
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
