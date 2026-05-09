; DESCRIPTION: Creates a yellow rectangular region at (153, 107) spanning 108 by 53 pixels.
; PLAN: r0=153(x), r1=107(y), r2=108(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 107
LDI r2, 108
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
