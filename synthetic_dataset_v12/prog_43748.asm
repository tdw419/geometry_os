; DESCRIPTION: Creates a white rectangular region at (179, 163) spanning 119 by 73 pixels.
; PLAN: r0=179(x), r1=163(y), r2=119(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 163
LDI r2, 119
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
