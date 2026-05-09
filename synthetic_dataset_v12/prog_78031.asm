; DESCRIPTION: Creates a blue rectangular region at (414, 75) spanning 40 by 48 pixels.
; PLAN: r0=414(x), r1=75(y), r2=40(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 75
LDI r2, 40
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
