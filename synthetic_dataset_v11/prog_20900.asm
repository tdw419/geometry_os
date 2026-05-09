; DESCRIPTION: Creates a black rectangular region at (21, 143) spanning 29 by 76 pixels.
; PLAN: r0=21(x), r1=143(y), r2=29(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 143
LDI r2, 29
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
