; DESCRIPTION: Creates a blue rectangular region at (379, 100) spanning 59 by 97 pixels.
; PLAN: r0=379(x), r1=100(y), r2=59(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 100
LDI r2, 59
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
