; DESCRIPTION: Creates a blue rectangular region at (56, 100) spanning 72 by 65 pixels.
; PLAN: r0=56(x), r1=100(y), r2=72(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 100
LDI r2, 72
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
