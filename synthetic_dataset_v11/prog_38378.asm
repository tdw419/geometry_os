; DESCRIPTION: Creates a black rectangular region at (81, 167) spanning 60 by 28 pixels.
; PLAN: r0=81(x), r1=167(y), r2=60(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 167
LDI r2, 60
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
