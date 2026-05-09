; DESCRIPTION: Creates a blue rectangular region at (178, 89) spanning 12 by 106 pixels.
; PLAN: r0=178(x), r1=89(y), r2=12(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 89
LDI r2, 12
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
