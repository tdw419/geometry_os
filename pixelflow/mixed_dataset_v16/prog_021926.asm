; DESCRIPTION: Creates a blue rectangular region at (383, 56) spanning 72 by 75 pixels.
; PLAN: r0=383(x), r1=56(y), r2=72(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 56
LDI r2, 72
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
