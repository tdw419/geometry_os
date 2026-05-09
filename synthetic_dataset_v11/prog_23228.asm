; DESCRIPTION: Creates a black rectangular region at (159, 103) spanning 85 by 26 pixels.
; PLAN: r0=159(x), r1=103(y), r2=85(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 103
LDI r2, 85
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
