; DESCRIPTION: Creates a blue rectangular region at (300, 65) spanning 34 by 100 pixels.
; PLAN: r0=300(x), r1=65(y), r2=34(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 65
LDI r2, 34
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
