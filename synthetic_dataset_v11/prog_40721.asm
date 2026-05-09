; DESCRIPTION: Creates a white rectangular region at (1, 179) spanning 116 by 75 pixels.
; PLAN: r0=1(x), r1=179(y), r2=116(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 179
LDI r2, 116
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
