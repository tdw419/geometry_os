; DESCRIPTION: Composite: . Then Renders a purple line between points (76, 41) and (255, 207). Then Renders a orange disk with center (34, 95) and radius 33.
; PLAN: r0=76(x1), r1=41(y1), r2=255(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=34(x), r1=95(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (76, 41) and (255, 207).
; PLAN: r0=76(x1), r1=41(y1), r2=255(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 41
LDI r2, 255
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (34, 95) and radius 33.
; PLAN: r0=34(x), r1=95(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 95
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
