; DESCRIPTION: Creates a white rectangular region at (236, 104) spanning 96 by 51 pixels.
; PLAN: r0=236(x), r1=104(y), r2=96(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 104
LDI r2, 96
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
