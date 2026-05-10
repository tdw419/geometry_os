; DESCRIPTION: Creates a yellow rectangular region at (208, 144) spanning 28 by 13 pixels.
; PLAN: r0=208(x), r1=144(y), r2=28(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 144
LDI r2, 28
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
