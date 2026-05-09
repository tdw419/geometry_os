; DESCRIPTION: Creates a black rectangular region at (217, 153) spanning 106 by 28 pixels.
; PLAN: r0=217(x), r1=153(y), r2=106(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 153
LDI r2, 106
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
