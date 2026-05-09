; DESCRIPTION: Renders a black box of size 39x55 starting at (357, 34).
; PLAN: r0=357(x), r1=34(y), r2=39(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 34
LDI r2, 39
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
