; DESCRIPTION: Creates a blue rectangular region at (5, 125) spanning 80 by 99 pixels.
; PLAN: r0=5(x), r1=125(y), r2=80(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 125
LDI r2, 80
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
