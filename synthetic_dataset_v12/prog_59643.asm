; DESCRIPTION: Creates a black rectangular region at (182, 117) spanning 83 by 26 pixels.
; PLAN: r0=182(x), r1=117(y), r2=83(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 117
LDI r2, 83
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
