; DESCRIPTION: Creates a red rectangular region at (8, 23) spanning 19 by 35 pixels.
; PLAN: r0=8(x), r1=23(y), r2=19(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 23
LDI r2, 19
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
