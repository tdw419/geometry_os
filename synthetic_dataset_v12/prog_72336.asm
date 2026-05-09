; DESCRIPTION: Creates a white rectangular region at (316, 1) spanning 80 by 49 pixels.
; PLAN: r0=316(x), r1=1(y), r2=80(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 1
LDI r2, 80
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
