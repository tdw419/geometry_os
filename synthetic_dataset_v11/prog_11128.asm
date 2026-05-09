; DESCRIPTION: Creates a red rectangular region at (26, 6) spanning 119 by 79 pixels.
; PLAN: r0=26(x), r1=6(y), r2=119(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 6
LDI r2, 119
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
