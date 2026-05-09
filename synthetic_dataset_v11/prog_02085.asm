; DESCRIPTION: Creates a green rectangular region at (7, 165) spanning 112 by 43 pixels.
; PLAN: r0=7(x), r1=165(y), r2=112(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 165
LDI r2, 112
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
