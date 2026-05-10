; DESCRIPTION: Creates a white rectangular region at (124, 40) spanning 112 by 100 pixels.
; PLAN: r0=124(x), r1=40(y), r2=112(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 40
LDI r2, 112
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
