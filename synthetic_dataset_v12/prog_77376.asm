; DESCRIPTION: Creates a blue rectangular region at (120, 84) spanning 85 by 33 pixels.
; PLAN: r0=120(x), r1=84(y), r2=85(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 84
LDI r2, 85
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
