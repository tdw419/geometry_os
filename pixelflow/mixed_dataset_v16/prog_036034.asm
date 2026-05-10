; DESCRIPTION: Creates a black rectangular region at (38, 98) spanning 107 by 98 pixels.
; PLAN: r0=38(x), r1=98(y), r2=107(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 98
LDI r2, 107
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
