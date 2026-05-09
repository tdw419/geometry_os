; DESCRIPTION: Creates a white rectangular region at (233, 72) spanning 35 by 90 pixels.
; PLAN: r0=233(x), r1=72(y), r2=35(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 72
LDI r2, 35
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
