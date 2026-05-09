; DESCRIPTION: Creates a black rectangular region at (104, 16) spanning 52 by 105 pixels.
; PLAN: r0=104(x), r1=16(y), r2=52(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 16
LDI r2, 52
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
