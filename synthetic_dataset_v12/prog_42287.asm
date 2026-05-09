; DESCRIPTION: Creates a black rectangular region at (342, 7) spanning 12 by 105 pixels.
; PLAN: r0=342(x), r1=7(y), r2=12(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 7
LDI r2, 12
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
