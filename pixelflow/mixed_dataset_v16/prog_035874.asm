; DESCRIPTION: Creates a green rectangular region at (315, 137) spanning 18 by 96 pixels.
; PLAN: r0=315(x), r1=137(y), r2=18(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 137
LDI r2, 18
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
