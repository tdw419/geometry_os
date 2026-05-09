; DESCRIPTION: Creates a yellow rectangular region at (139, 15) spanning 113 by 34 pixels.
; PLAN: r0=139(x), r1=15(y), r2=113(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 15
LDI r2, 113
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
