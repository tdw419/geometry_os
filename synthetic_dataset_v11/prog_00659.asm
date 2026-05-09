; DESCRIPTION: Creates a red rectangular region at (125, 99) spanning 101 by 76 pixels.
; PLAN: r0=125(x), r1=99(y), r2=101(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 99
LDI r2, 101
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
