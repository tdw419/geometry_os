; DESCRIPTION: Creates a red rectangular region at (25, 25) spanning 114 by 84 pixels.
; PLAN: r0=25(x), r1=25(y), r2=114(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 25
LDI r2, 114
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
