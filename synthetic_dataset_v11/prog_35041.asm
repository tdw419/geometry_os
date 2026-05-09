; DESCRIPTION: Creates a blue rectangular region at (33, 79) spanning 95 by 110 pixels.
; PLAN: r0=33(x), r1=79(y), r2=95(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 79
LDI r2, 95
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
