; DESCRIPTION: Creates a white rectangular region at (121, 124) spanning 31 by 15 pixels.
; PLAN: r0=121(x), r1=124(y), r2=31(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 124
LDI r2, 31
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
