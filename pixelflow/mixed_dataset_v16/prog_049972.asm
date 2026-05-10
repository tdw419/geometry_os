; DESCRIPTION: Creates a blue rectangular region at (224, 89) spanning 31 by 35 pixels.
; PLAN: r0=224(x), r1=89(y), r2=31(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 89
LDI r2, 31
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
