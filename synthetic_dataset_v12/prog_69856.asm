; DESCRIPTION: Creates a green rectangular region at (431, 151) spanning 70 by 31 pixels.
; PLAN: r0=431(x), r1=151(y), r2=70(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 151
LDI r2, 70
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
