; DESCRIPTION: Creates a red rectangular region at (81, 158) spanning 98 by 87 pixels.
; PLAN: r0=81(x), r1=158(y), r2=98(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 158
LDI r2, 98
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
