; DESCRIPTION: Creates a blue rectangular region at (106, 78) spanning 72 by 85 pixels.
; PLAN: r0=106(x), r1=78(y), r2=72(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 78
LDI r2, 72
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
