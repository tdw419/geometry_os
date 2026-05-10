; DESCRIPTION: Creates a red rectangular region at (334, 117) spanning 46 by 18 pixels.
; PLAN: r0=334(x), r1=117(y), r2=46(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 117
LDI r2, 46
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
