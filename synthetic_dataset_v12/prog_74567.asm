; DESCRIPTION: Creates a purple rectangular region at (240, 34) spanning 77 by 15 pixels.
; PLAN: r0=240(x), r1=34(y), r2=77(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 34
LDI r2, 77
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
