; DESCRIPTION: Creates a red rectangular region at (75, 85) spanning 114 by 37 pixels.
; PLAN: r0=75(x), r1=85(y), r2=114(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 85
LDI r2, 114
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
