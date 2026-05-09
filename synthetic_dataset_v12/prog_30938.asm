; DESCRIPTION: Creates a blue rectangular region at (250, 149) spanning 89 by 30 pixels.
; PLAN: r0=250(x), r1=149(y), r2=89(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 149
LDI r2, 89
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
