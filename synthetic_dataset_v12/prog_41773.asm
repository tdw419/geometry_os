; DESCRIPTION: Creates a white rectangular region at (1, 47) spanning 119 by 96 pixels.
; PLAN: r0=1(x), r1=47(y), r2=119(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 47
LDI r2, 119
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
