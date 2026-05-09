; DESCRIPTION: Creates a black rectangular region at (214, 123) spanning 34 by 13 pixels.
; PLAN: r0=214(x), r1=123(y), r2=34(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 123
LDI r2, 34
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
