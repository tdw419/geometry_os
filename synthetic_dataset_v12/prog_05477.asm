; DESCRIPTION: Creates a yellow rectangular region at (381, 113) spanning 47 by 58 pixels.
; PLAN: r0=381(x), r1=113(y), r2=47(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 113
LDI r2, 47
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
