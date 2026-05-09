; DESCRIPTION: Creates a red rectangular region at (216, 75) spanning 60 by 15 pixels.
; PLAN: r0=216(x), r1=75(y), r2=60(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 75
LDI r2, 60
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
