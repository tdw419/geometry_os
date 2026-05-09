; DESCRIPTION: Creates a black rectangular region at (365, 43) spanning 39 by 117 pixels.
; PLAN: r0=365(x), r1=43(y), r2=39(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 43
LDI r2, 39
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
