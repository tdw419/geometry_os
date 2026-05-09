; DESCRIPTION: Creates a white rectangular region at (80, 167) spanning 112 by 81 pixels.
; PLAN: r0=80(x), r1=167(y), r2=112(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 167
LDI r2, 112
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
