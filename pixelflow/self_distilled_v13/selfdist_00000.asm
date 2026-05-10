; DESCRIPTION: Creates a yellow diamond shape using 4 lines meeting at the center.
; PLAN: r0=4(x), r1=4(y), r2=24(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 4
LDI r2, 24
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
