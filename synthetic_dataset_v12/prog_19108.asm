; DESCRIPTION: Creates a blue rectangular region at (61, 2) spanning 48 by 110 pixels.
; PLAN: r0=61(x), r1=2(y), r2=48(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 2
LDI r2, 48
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
