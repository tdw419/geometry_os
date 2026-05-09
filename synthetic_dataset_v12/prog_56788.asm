; DESCRIPTION: Creates a black rectangular region at (19, 6) spanning 23 by 34 pixels.
; PLAN: r0=19(x), r1=6(y), r2=23(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 6
LDI r2, 23
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
