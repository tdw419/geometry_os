; DESCRIPTION: Creates a blue rectangular region at (428, 155) spanning 30 by 92 pixels.
; PLAN: r0=428(x), r1=155(y), r2=30(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 155
LDI r2, 30
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
