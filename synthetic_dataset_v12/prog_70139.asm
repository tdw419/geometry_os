; DESCRIPTION: Creates a yellow rectangular region at (260, 144) spanning 66 by 26 pixels.
; PLAN: r0=260(x), r1=144(y), r2=66(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 144
LDI r2, 66
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
