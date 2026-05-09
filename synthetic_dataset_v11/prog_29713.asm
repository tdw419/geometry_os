; DESCRIPTION: Creates a yellow rectangular region at (116, 106) spanning 81 by 93 pixels.
; PLAN: r0=116(x), r1=106(y), r2=81(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 106
LDI r2, 81
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
