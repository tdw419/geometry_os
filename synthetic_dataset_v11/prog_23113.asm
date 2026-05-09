; DESCRIPTION: Creates a white rectangular region at (162, 60) spanning 60 by 119 pixels.
; PLAN: r0=162(x), r1=60(y), r2=60(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 60
LDI r2, 60
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
