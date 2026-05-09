; DESCRIPTION: Creates a blue rectangular region at (70, 99) spanning 43 by 106 pixels.
; PLAN: r0=70(x), r1=99(y), r2=43(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 99
LDI r2, 43
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
