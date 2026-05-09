; DESCRIPTION: Creates a red rectangular region at (170, 85) spanning 52 by 83 pixels.
; PLAN: r0=170(x), r1=85(y), r2=52(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 85
LDI r2, 52
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
