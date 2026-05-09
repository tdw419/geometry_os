; DESCRIPTION: Creates a red rectangular region at (292, 75) spanning 58 by 38 pixels.
; PLAN: r0=292(x), r1=75(y), r2=58(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 75
LDI r2, 58
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
