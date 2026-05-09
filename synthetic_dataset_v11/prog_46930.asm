; DESCRIPTION: Creates a black rectangular region at (25, 81) spanning 49 by 60 pixels.
; PLAN: r0=25(x), r1=81(y), r2=49(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 81
LDI r2, 49
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
