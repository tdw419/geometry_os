; DESCRIPTION: Creates a red rectangular region at (266, 2) spanning 49 by 55 pixels.
; PLAN: r0=266(x), r1=2(y), r2=49(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 2
LDI r2, 49
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
