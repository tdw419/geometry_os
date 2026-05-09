; DESCRIPTION: Creates a black rectangular region at (95, 62) spanning 83 by 113 pixels.
; PLAN: r0=95(x), r1=62(y), r2=83(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 62
LDI r2, 83
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
