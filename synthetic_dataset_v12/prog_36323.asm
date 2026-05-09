; DESCRIPTION: Creates a purple rectangular region at (20, 37) spanning 22 by 72 pixels.
; PLAN: r0=20(x), r1=37(y), r2=22(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 37
LDI r2, 22
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
