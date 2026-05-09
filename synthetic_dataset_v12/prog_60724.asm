; DESCRIPTION: Creates a yellow rectangular region at (93, 61) spanning 101 by 79 pixels.
; PLAN: r0=93(x), r1=61(y), r2=101(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 61
LDI r2, 101
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
