; DESCRIPTION: Creates a white rectangular region at (236, 26) spanning 115 by 104 pixels.
; PLAN: r0=236(x), r1=26(y), r2=115(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 26
LDI r2, 115
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
