; DESCRIPTION: Creates a yellow rectangular region at (278, 178) spanning 26 by 44 pixels.
; PLAN: r0=278(x), r1=178(y), r2=26(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 178
LDI r2, 26
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
