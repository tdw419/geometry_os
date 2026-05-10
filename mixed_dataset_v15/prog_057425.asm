; DESCRIPTION: Creates a black rectangular region at (12, 142) spanning 39 by 95 pixels.
; PLAN: r0=12(x), r1=142(y), r2=39(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 142
LDI r2, 39
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
