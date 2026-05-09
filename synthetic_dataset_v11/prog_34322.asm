; DESCRIPTION: Creates a red rectangular region at (99, 146) spanning 101 by 35 pixels.
; PLAN: r0=99(x), r1=146(y), r2=101(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 146
LDI r2, 101
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
