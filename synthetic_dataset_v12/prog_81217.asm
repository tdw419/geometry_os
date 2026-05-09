; DESCRIPTION: Creates a blue rectangular region at (468, 113) spanning 11 by 56 pixels.
; PLAN: r0=468(x), r1=113(y), r2=11(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 113
LDI r2, 11
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
