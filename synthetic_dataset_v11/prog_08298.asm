; DESCRIPTION: Creates a blue rectangular region at (20, 34) spanning 79 by 75 pixels.
; PLAN: r0=20(x), r1=34(y), r2=79(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 34
LDI r2, 79
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
