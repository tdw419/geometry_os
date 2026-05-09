; DESCRIPTION: Creates a yellow rectangular region at (144, 73) spanning 31 by 38 pixels.
; PLAN: r0=144(x), r1=73(y), r2=31(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 73
LDI r2, 31
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
