; DESCRIPTION: Creates a blue rectangular region at (201, 58) spanning 98 by 86 pixels.
; PLAN: r0=201(x), r1=58(y), r2=98(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 58
LDI r2, 98
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
