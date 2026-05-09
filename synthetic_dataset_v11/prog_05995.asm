; DESCRIPTION: Creates a white rectangular region at (74, 121) spanning 104 by 107 pixels.
; PLAN: r0=74(x), r1=121(y), r2=104(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 121
LDI r2, 104
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
