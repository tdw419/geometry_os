; DESCRIPTION: Creates a yellow rectangular region at (310, 163) spanning 29 by 71 pixels.
; PLAN: r0=310(x), r1=163(y), r2=29(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 163
LDI r2, 29
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
