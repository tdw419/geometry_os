; DESCRIPTION: Creates a black rectangular region at (138, 9) spanning 108 by 87 pixels.
; PLAN: r0=138(x), r1=9(y), r2=108(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 9
LDI r2, 108
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
