; DESCRIPTION: Creates a blue rectangular region at (47, 43) spanning 33 by 100 pixels.
; PLAN: r0=47(x), r1=43(y), r2=33(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 43
LDI r2, 33
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
