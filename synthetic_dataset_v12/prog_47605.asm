; DESCRIPTION: Creates a white rectangular region at (10, 141) spanning 96 by 106 pixels.
; PLAN: r0=10(x), r1=141(y), r2=96(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 141
LDI r2, 96
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
