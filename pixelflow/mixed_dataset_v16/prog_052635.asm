; DESCRIPTION: Creates a black rectangular region at (44, 33) spanning 29 by 90 pixels.
; PLAN: r0=44(x), r1=33(y), r2=29(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 33
LDI r2, 29
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
