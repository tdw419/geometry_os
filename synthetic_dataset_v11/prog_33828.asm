; DESCRIPTION: Creates a white rectangular region at (104, 105) spanning 55 by 103 pixels.
; PLAN: r0=104(x), r1=105(y), r2=55(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 105
LDI r2, 55
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
