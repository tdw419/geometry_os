; DESCRIPTION: Creates a white rectangular region at (194, 106) spanning 36 by 49 pixels.
; PLAN: r0=194(x), r1=106(y), r2=36(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 106
LDI r2, 36
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
