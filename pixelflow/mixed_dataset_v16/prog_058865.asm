; DESCRIPTION: Creates a green rectangular region at (116, 62) spanning 44 by 25 pixels.
; PLAN: r0=116(x), r1=62(y), r2=44(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 62
LDI r2, 44
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
