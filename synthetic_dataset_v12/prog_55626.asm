; DESCRIPTION: Creates a black rectangular region at (77, 103) spanning 97 by 62 pixels.
; PLAN: r0=77(x), r1=103(y), r2=97(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 103
LDI r2, 97
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
