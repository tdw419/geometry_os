; DESCRIPTION: Creates a black rectangular region at (114, 138) spanning 96 by 99 pixels.
; PLAN: r0=114(x), r1=138(y), r2=96(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 138
LDI r2, 96
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
