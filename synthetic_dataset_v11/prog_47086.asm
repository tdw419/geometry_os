; DESCRIPTION: Creates a red rectangular region at (68, 10) spanning 35 by 95 pixels.
; PLAN: r0=68(x), r1=10(y), r2=35(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 10
LDI r2, 35
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
