; DESCRIPTION: Creates a blue rectangular region at (13, 48) spanning 31 by 99 pixels.
; PLAN: r0=13(x), r1=48(y), r2=31(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 48
LDI r2, 31
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
