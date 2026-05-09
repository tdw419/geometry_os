; DESCRIPTION: Creates a yellow rectangular region at (323, 106) spanning 17 by 96 pixels.
; PLAN: r0=323(x), r1=106(y), r2=17(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 106
LDI r2, 17
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
