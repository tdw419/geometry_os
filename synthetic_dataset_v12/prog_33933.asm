; DESCRIPTION: Creates a blue rectangular region at (201, 137) spanning 59 by 114 pixels.
; PLAN: r0=201(x), r1=137(y), r2=59(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 137
LDI r2, 59
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
