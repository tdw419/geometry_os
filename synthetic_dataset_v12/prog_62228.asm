; DESCRIPTION: Creates a yellow rectangular region at (185, 112) spanning 41 by 119 pixels.
; PLAN: r0=185(x), r1=112(y), r2=41(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 112
LDI r2, 41
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
