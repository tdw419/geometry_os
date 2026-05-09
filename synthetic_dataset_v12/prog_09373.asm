; DESCRIPTION: Creates a green rectangular region at (172, 175) spanning 62 by 56 pixels.
; PLAN: r0=172(x), r1=175(y), r2=62(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 175
LDI r2, 62
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
