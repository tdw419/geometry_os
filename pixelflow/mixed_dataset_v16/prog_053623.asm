; DESCRIPTION: Creates a green rectangular region at (364, 19) spanning 15 by 10 pixels.
; PLAN: r0=364(x), r1=19(y), r2=15(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 19
LDI r2, 15
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
