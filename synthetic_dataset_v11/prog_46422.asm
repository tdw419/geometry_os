; DESCRIPTION: Creates a red rectangular region at (26, 106) spanning 115 by 83 pixels.
; PLAN: r0=26(x), r1=106(y), r2=115(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 106
LDI r2, 115
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
