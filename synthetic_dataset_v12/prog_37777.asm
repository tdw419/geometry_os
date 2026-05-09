; DESCRIPTION: Creates a white rectangular region at (431, 33) spanning 35 by 101 pixels.
; PLAN: r0=431(x), r1=33(y), r2=35(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 33
LDI r2, 35
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
