; DESCRIPTION: Creates a red rectangular region at (86, 95) spanning 66 by 101 pixels.
; PLAN: r0=86(x), r1=95(y), r2=66(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 95
LDI r2, 66
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
