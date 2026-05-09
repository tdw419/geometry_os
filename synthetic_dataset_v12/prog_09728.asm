; DESCRIPTION: Creates a black rectangular region at (296, 64) spanning 97 by 83 pixels.
; PLAN: r0=296(x), r1=64(y), r2=97(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 64
LDI r2, 97
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
