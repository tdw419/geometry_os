; DESCRIPTION: Creates a black rectangular region at (91, 140) spanning 66 by 112 pixels.
; PLAN: r0=91(x), r1=140(y), r2=66(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 140
LDI r2, 66
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
