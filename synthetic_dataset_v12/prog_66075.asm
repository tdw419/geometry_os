; DESCRIPTION: Creates a red rectangular region at (105, 101) spanning 90 by 99 pixels.
; PLAN: r0=105(x), r1=101(y), r2=90(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 101
LDI r2, 90
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
