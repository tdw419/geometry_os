; DESCRIPTION: Creates a red rectangular region at (26, 109) spanning 83 by 119 pixels.
; PLAN: r0=26(x), r1=109(y), r2=83(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 109
LDI r2, 83
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
