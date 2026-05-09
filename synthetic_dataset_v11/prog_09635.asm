; DESCRIPTION: Creates a blue rectangular region at (222, 141) spanning 18 by 66 pixels.
; PLAN: r0=222(x), r1=141(y), r2=18(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 141
LDI r2, 18
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
