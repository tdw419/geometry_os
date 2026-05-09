; DESCRIPTION: Creates a blue rectangular region at (55, 95) spanning 14 by 21 pixels.
; PLAN: r0=55(x), r1=95(y), r2=14(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 95
LDI r2, 14
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
