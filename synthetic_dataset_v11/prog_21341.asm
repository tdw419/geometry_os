; DESCRIPTION: Creates a blue rectangular region at (102, 78) spanning 47 by 106 pixels.
; PLAN: r0=102(x), r1=78(y), r2=47(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 78
LDI r2, 47
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
