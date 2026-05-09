; DESCRIPTION: Creates a black rectangular region at (204, 159) spanning 40 by 34 pixels.
; PLAN: r0=204(x), r1=159(y), r2=40(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 159
LDI r2, 40
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
