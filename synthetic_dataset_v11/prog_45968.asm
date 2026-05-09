; DESCRIPTION: Creates a blue rectangular region at (15, 145) spanning 90 by 55 pixels.
; PLAN: r0=15(x), r1=145(y), r2=90(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 145
LDI r2, 90
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
