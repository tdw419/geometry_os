; DESCRIPTION: Creates a black rectangular region at (112, 165) spanning 75 by 13 pixels.
; PLAN: r0=112(x), r1=165(y), r2=75(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 165
LDI r2, 75
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
