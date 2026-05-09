; DESCRIPTION: Creates a yellow rectangular region at (378, 141) spanning 39 by 112 pixels.
; PLAN: r0=378(x), r1=141(y), r2=39(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 141
LDI r2, 39
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
