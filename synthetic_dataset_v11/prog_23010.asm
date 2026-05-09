; DESCRIPTION: Creates a black rectangular region at (151, 7) spanning 18 by 114 pixels.
; PLAN: r0=151(x), r1=7(y), r2=18(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 7
LDI r2, 18
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
