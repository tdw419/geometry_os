; DESCRIPTION: Creates a red rectangular region at (15, 10) spanning 100 by 68 pixels.
; PLAN: r0=15(x), r1=10(y), r2=100(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 10
LDI r2, 100
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
