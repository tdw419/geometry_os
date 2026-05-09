; DESCRIPTION: Creates a red rectangular region at (399, 124) spanning 97 by 117 pixels.
; PLAN: r0=399(x), r1=124(y), r2=97(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 124
LDI r2, 97
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
