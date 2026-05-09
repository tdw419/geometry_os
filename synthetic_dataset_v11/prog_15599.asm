; DESCRIPTION: Creates a blue rectangular region at (2, 62) spanning 48 by 18 pixels.
; PLAN: r0=2(x), r1=62(y), r2=48(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 62
LDI r2, 48
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
