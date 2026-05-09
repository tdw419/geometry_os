; DESCRIPTION: Creates a green rectangular region at (194, 41) spanning 45 by 71 pixels.
; PLAN: r0=194(x), r1=41(y), r2=45(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 41
LDI r2, 45
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
