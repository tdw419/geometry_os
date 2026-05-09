; DESCRIPTION: Creates a black rectangular region at (417, 162) spanning 80 by 62 pixels.
; PLAN: r0=417(x), r1=162(y), r2=80(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 162
LDI r2, 80
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
