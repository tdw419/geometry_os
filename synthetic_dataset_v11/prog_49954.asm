; DESCRIPTION: Creates a blue rectangular region at (134, 19) spanning 44 by 75 pixels.
; PLAN: r0=134(x), r1=19(y), r2=44(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 19
LDI r2, 44
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
