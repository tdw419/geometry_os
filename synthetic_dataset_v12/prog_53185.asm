; DESCRIPTION: Creates a red rectangular region at (421, 85) spanning 80 by 114 pixels.
; PLAN: r0=421(x), r1=85(y), r2=80(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 85
LDI r2, 80
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
