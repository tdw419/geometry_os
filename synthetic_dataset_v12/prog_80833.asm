; DESCRIPTION: Creates a blue rectangular region at (83, 48) spanning 105 by 83 pixels.
; PLAN: r0=83(x), r1=48(y), r2=105(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 48
LDI r2, 105
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
