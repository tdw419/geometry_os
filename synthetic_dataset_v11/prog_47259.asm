; DESCRIPTION: Creates a red rectangular region at (101, 84) spanning 99 by 26 pixels.
; PLAN: r0=101(x), r1=84(y), r2=99(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 84
LDI r2, 99
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
