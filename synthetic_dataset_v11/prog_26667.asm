; DESCRIPTION: Creates a blue rectangular region at (3, 66) spanning 76 by 102 pixels.
; PLAN: r0=3(x), r1=66(y), r2=76(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 66
LDI r2, 76
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
