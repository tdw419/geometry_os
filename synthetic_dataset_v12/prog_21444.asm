; DESCRIPTION: Creates a green rectangular region at (153, 167) spanning 53 by 17 pixels.
; PLAN: r0=153(x), r1=167(y), r2=53(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 167
LDI r2, 53
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
