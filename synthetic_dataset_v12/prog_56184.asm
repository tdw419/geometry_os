; DESCRIPTION: Renders a red disk with center (235, 153) and radius 41.
; PLAN: r0=235(x), r1=153(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 153
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
