; DESCRIPTION: Creates a blue rectangular region at (283, 17) spanning 81 by 41 pixels.
; PLAN: r0=283(x), r1=17(y), r2=81(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 17
LDI r2, 81
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
