; DESCRIPTION: Creates a black rectangular region at (123, 167) spanning 59 by 15 pixels.
; PLAN: r0=123(x), r1=167(y), r2=59(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 167
LDI r2, 59
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
