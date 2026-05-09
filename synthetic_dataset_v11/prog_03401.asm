; DESCRIPTION: Composite: . Then Renders a black box of size 24x81 starting at (149, 41). Then Places a cyan line segment connecting (141, 83) to (81, 232).
; PLAN: r0=149(x), r1=41(y), r2=24(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=141(x1), r1=83(y1), r2=81(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black box of size 24x81 starting at (149, 41).
; PLAN: r0=149(x), r1=41(y), r2=24(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 41
LDI r2, 24
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (141, 83) to (81, 232).
; PLAN: r0=141(x1), r1=83(y1), r2=81(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 83
LDI r2, 81
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
