; DESCRIPTION: Creates a red rectangular region at (80, 122) spanning 79 by 114 pixels.
; PLAN: r0=80(x), r1=122(y), r2=79(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 122
LDI r2, 79
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
