; DESCRIPTION: Creates a white rectangular region at (2, 73) spanning 17 by 96 pixels.
; PLAN: r0=2(x), r1=73(y), r2=17(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 73
LDI r2, 17
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
