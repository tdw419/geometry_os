; DESCRIPTION: Creates a red rectangular region at (166, 52) spanning 19 by 105 pixels.
; PLAN: r0=166(x), r1=52(y), r2=19(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 52
LDI r2, 19
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
