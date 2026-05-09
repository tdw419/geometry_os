; DESCRIPTION: Creates a yellow rectangular region at (239, 114) spanning 41 by 111 pixels.
; PLAN: r0=239(x), r1=114(y), r2=41(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 114
LDI r2, 41
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
