; DESCRIPTION: Creates a black rectangular region at (428, 35) spanning 44 by 87 pixels.
; PLAN: r0=428(x), r1=35(y), r2=44(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 35
LDI r2, 44
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
