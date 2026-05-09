; DESCRIPTION: Creates a black rectangular region at (204, 82) spanning 49 by 21 pixels.
; PLAN: r0=204(x), r1=82(y), r2=49(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 82
LDI r2, 49
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
