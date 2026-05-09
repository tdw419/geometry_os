; DESCRIPTION: Creates a black rectangular region at (423, 213) spanning 76 by 14 pixels.
; PLAN: r0=423(x), r1=213(y), r2=76(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 213
LDI r2, 76
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
