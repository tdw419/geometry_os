; DESCRIPTION: Creates a black rectangular region at (424, 118) spanning 39 by 44 pixels.
; PLAN: r0=424(x), r1=118(y), r2=39(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 118
LDI r2, 39
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
