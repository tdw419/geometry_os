; DESCRIPTION: Creates a black rectangular region at (26, 140) spanning 103 by 55 pixels.
; PLAN: r0=26(x), r1=140(y), r2=103(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 140
LDI r2, 103
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
