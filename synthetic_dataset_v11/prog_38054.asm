; DESCRIPTION: Creates a blue rectangular region at (2, 81) spanning 56 by 19 pixels.
; PLAN: r0=2(x), r1=81(y), r2=56(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 81
LDI r2, 56
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
