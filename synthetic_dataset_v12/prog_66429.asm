; DESCRIPTION: Creates a blue rectangular region at (339, 31) spanning 90 by 46 pixels.
; PLAN: r0=339(x), r1=31(y), r2=90(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 31
LDI r2, 90
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
