; DESCRIPTION: Creates a yellow rectangular region at (201, 86) spanning 96 by 45 pixels.
; PLAN: r0=201(x), r1=86(y), r2=96(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 86
LDI r2, 96
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
