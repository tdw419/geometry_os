; DESCRIPTION: Creates a blue rectangular region at (312, 44) spanning 23 by 13 pixels.
; PLAN: r0=312(x), r1=44(y), r2=23(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 44
LDI r2, 23
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
