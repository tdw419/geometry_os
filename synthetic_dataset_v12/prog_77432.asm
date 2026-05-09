; DESCRIPTION: Creates a black rectangular region at (199, 93) spanning 101 by 118 pixels.
; PLAN: r0=199(x), r1=93(y), r2=101(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 93
LDI r2, 101
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
