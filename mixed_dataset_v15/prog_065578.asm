; DESCRIPTION: Creates a black rectangular region at (101, 123) spanning 27 by 44 pixels.
; PLAN: r0=101(x), r1=123(y), r2=27(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 123
LDI r2, 27
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
