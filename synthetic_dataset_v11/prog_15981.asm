; DESCRIPTION: Creates a yellow rectangular region at (134, 183) spanning 21 by 46 pixels.
; PLAN: r0=134(x), r1=183(y), r2=21(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 183
LDI r2, 21
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
