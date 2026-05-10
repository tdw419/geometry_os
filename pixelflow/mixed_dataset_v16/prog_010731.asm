; DESCRIPTION: Creates a yellow rectangular region at (426, 75) spanning 47 by 41 pixels.
; PLAN: r0=426(x), r1=75(y), r2=47(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 75
LDI r2, 47
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
