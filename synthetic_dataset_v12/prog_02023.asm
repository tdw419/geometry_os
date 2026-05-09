; DESCRIPTION: Creates a black rectangular region at (175, 26) spanning 44 by 118 pixels.
; PLAN: r0=175(x), r1=26(y), r2=44(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 26
LDI r2, 44
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
