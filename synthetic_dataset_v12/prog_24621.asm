; DESCRIPTION: Creates a white rectangular region at (331, 2) spanning 108 by 25 pixels.
; PLAN: r0=331(x), r1=2(y), r2=108(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 2
LDI r2, 108
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
