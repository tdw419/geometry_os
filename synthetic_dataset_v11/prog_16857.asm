; DESCRIPTION: Creates a blue rectangular region at (75, 32) spanning 110 by 112 pixels.
; PLAN: r0=75(x), r1=32(y), r2=110(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 32
LDI r2, 110
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
