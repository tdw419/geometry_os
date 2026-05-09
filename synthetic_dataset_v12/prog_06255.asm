; DESCRIPTION: Creates a blue rectangular region at (80, 73) spanning 33 by 85 pixels.
; PLAN: r0=80(x), r1=73(y), r2=33(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 73
LDI r2, 33
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
