; DESCRIPTION: Creates a purple rectangular region at (151, 18) spanning 114 by 12 pixels.
; PLAN: r0=151(x), r1=18(y), r2=114(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 18
LDI r2, 114
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
