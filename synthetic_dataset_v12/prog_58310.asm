; DESCRIPTION: Creates a blue rectangular region at (417, 77) spanning 69 by 35 pixels.
; PLAN: r0=417(x), r1=77(y), r2=69(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 77
LDI r2, 69
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
