; DESCRIPTION: Creates a yellow rectangular region at (12, 41) spanning 33 by 111 pixels.
; PLAN: r0=12(x), r1=41(y), r2=33(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 41
LDI r2, 33
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
