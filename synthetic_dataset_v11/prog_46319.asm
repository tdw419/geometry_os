; DESCRIPTION: Creates a red rectangular region at (2, 108) spanning 90 by 114 pixels.
; PLAN: r0=2(x), r1=108(y), r2=90(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 108
LDI r2, 90
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
