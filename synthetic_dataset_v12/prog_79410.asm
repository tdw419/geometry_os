; DESCRIPTION: Creates a black rectangular region at (342, 167) spanning 105 by 82 pixels.
; PLAN: r0=342(x), r1=167(y), r2=105(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 167
LDI r2, 105
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
