; DESCRIPTION: Creates a yellow rectangular region at (9, 142) spanning 83 by 90 pixels.
; PLAN: r0=9(x), r1=142(y), r2=83(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 142
LDI r2, 83
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
