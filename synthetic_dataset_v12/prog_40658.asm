; DESCRIPTION: Creates a white rectangular region at (378, 196) spanning 44 by 34 pixels.
; PLAN: r0=378(x), r1=196(y), r2=44(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 196
LDI r2, 44
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
