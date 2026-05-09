; DESCRIPTION: Creates a white rectangular region at (104, 46) spanning 96 by 78 pixels.
; PLAN: r0=104(x), r1=46(y), r2=96(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 46
LDI r2, 96
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
