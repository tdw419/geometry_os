; DESCRIPTION: Creates a black rectangular region at (167, 84) spanning 81 by 70 pixels.
; PLAN: r0=167(x), r1=84(y), r2=81(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 84
LDI r2, 81
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
