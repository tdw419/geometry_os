; DESCRIPTION: Creates a black rectangular region at (138, 0) spanning 13 by 81 pixels.
; PLAN: r0=138(x), r1=0(y), r2=13(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 0
LDI r2, 13
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
