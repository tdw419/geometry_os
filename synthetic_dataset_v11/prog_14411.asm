; DESCRIPTION: Creates a red rectangular region at (100, 35) spanning 94 by 95 pixels.
; PLAN: r0=100(x), r1=35(y), r2=94(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 35
LDI r2, 94
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
