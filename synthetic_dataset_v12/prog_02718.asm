; DESCRIPTION: Creates a black rectangular region at (269, 140) spanning 43 by 99 pixels.
; PLAN: r0=269(x), r1=140(y), r2=43(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 140
LDI r2, 43
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
