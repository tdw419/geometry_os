; DESCRIPTION: Creates a blue rectangular region at (188, 92) spanning 120 by 97 pixels.
; PLAN: r0=188(x), r1=92(y), r2=120(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 92
LDI r2, 120
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
