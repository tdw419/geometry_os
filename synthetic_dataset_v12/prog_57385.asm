; DESCRIPTION: Creates a blue rectangular region at (201, 71) spanning 47 by 13 pixels.
; PLAN: r0=201(x), r1=71(y), r2=47(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 71
LDI r2, 47
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
