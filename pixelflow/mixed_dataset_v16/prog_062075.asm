; DESCRIPTION: Creates a black rectangular region at (44, 184) spanning 95 by 39 pixels.
; PLAN: r0=44(x), r1=184(y), r2=95(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 184
LDI r2, 95
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
