; DESCRIPTION: Creates a purple rectangular region at (77, 225) spanning 34 by 30 pixels.
; PLAN: r0=77(x), r1=225(y), r2=34(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 225
LDI r2, 34
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
