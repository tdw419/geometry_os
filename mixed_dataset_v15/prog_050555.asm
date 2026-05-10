; DESCRIPTION: Creates a black rectangular region at (31, 82) spanning 69 by 75 pixels.
; PLAN: r0=31(x), r1=82(y), r2=69(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 82
LDI r2, 69
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
