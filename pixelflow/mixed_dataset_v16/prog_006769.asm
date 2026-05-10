; DESCRIPTION: Creates a blue rectangular region at (290, 64) spanning 79 by 119 pixels.
; PLAN: r0=290(x), r1=64(y), r2=79(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 64
LDI r2, 79
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
