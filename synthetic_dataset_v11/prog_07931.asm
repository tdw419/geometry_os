; DESCRIPTION: Creates a red rectangular region at (75, 122) spanning 12 by 114 pixels.
; PLAN: r0=75(x), r1=122(y), r2=12(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 122
LDI r2, 12
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
