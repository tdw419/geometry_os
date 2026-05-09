; DESCRIPTION: Creates a yellow rectangular region at (140, 230) spanning 72 by 26 pixels.
; PLAN: r0=140(x), r1=230(y), r2=72(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 230
LDI r2, 72
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
