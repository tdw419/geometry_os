; DESCRIPTION: Creates a blue rectangular region at (49, 149) spanning 14 by 102 pixels.
; PLAN: r0=49(x), r1=149(y), r2=14(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 149
LDI r2, 14
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
