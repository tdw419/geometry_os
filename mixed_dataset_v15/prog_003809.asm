; DESCRIPTION: Creates a blue rectangular region at (381, 11) spanning 10 by 96 pixels.
; PLAN: r0=381(x), r1=11(y), r2=10(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 11
LDI r2, 10
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
