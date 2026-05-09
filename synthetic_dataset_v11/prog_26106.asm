; DESCRIPTION: Creates a blue rectangular region at (80, 25) spanning 13 by 112 pixels.
; PLAN: r0=80(x), r1=25(y), r2=13(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 25
LDI r2, 13
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
