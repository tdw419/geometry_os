; DESCRIPTION: Creates a black rectangular region at (43, 194) spanning 104 by 28 pixels.
; PLAN: r0=43(x), r1=194(y), r2=104(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 194
LDI r2, 104
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
