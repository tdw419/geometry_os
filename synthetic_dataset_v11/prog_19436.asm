; DESCRIPTION: Composite: . Then Places a orange line segment connecting (235, 189) to (90, 143). Then Renders a purple disk with center (208, 175) and radius 41.
; PLAN: r0=235(x1), r1=189(y1), r2=90(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=208(x), r1=175(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange line segment connecting (235, 189) to (90, 143).
; PLAN: r0=235(x1), r1=189(y1), r2=90(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 189
LDI r2, 90
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (208, 175) and radius 41.
; PLAN: r0=208(x), r1=175(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 175
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
