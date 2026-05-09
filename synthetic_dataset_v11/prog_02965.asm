; DESCRIPTION: Renders a cyan line between points (118, 41) and (235, 71).
; PLAN: r0=118(x1), r1=41(y1), r2=235(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 41
LDI r2, 235
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
