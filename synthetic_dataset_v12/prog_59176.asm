; DESCRIPTION: Creates a yellow rectangular region at (293, 26) spanning 114 by 53 pixels.
; PLAN: r0=293(x), r1=26(y), r2=114(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 26
LDI r2, 114
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
