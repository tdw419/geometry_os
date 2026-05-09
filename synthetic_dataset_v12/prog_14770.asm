; DESCRIPTION: Creates a blue rectangular region at (80, 39) spanning 105 by 34 pixels.
; PLAN: r0=80(x), r1=39(y), r2=105(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 39
LDI r2, 105
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
