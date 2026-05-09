; DESCRIPTION: Creates a black rectangular region at (214, 125) spanning 83 by 29 pixels.
; PLAN: r0=214(x), r1=125(y), r2=83(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 125
LDI r2, 83
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
