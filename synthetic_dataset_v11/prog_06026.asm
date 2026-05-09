; DESCRIPTION: Creates a black rectangular region at (72, 104) spanning 70 by 51 pixels.
; PLAN: r0=72(x), r1=104(y), r2=70(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 104
LDI r2, 70
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
