; DESCRIPTION: Creates a red rectangular region at (226, 75) spanning 119 by 80 pixels.
; PLAN: r0=226(x), r1=75(y), r2=119(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 75
LDI r2, 119
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
