; DESCRIPTION: Creates a white rectangular region at (181, 158) spanning 48 by 77 pixels.
; PLAN: r0=181(x), r1=158(y), r2=48(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 158
LDI r2, 48
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
