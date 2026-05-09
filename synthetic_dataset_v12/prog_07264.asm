; DESCRIPTION: Creates a black rectangular region at (90, 72) spanning 110 by 117 pixels.
; PLAN: r0=90(x), r1=72(y), r2=110(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 72
LDI r2, 110
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
