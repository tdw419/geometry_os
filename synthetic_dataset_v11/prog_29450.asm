; DESCRIPTION: Creates a white rectangular region at (142, 194) spanning 66 by 35 pixels.
; PLAN: r0=142(x), r1=194(y), r2=66(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 194
LDI r2, 66
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
