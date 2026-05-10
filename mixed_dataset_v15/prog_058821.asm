; DESCRIPTION: Creates a yellow rectangular region at (332, 13) spanning 109 by 115 pixels.
; PLAN: r0=332(x), r1=13(y), r2=109(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 13
LDI r2, 109
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
