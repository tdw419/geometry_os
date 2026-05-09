; DESCRIPTION: Creates a white rectangular region at (270, 54) spanning 119 by 102 pixels.
; PLAN: r0=270(x), r1=54(y), r2=119(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 54
LDI r2, 119
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
