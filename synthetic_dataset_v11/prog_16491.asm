; DESCRIPTION: Creates a white rectangular region at (47, 115) spanning 25 by 112 pixels.
; PLAN: r0=47(x), r1=115(y), r2=25(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 115
LDI r2, 25
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
