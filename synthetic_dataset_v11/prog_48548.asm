; DESCRIPTION: Renders a cyan line between points (89, 109) and (208, 159).
; PLAN: r0=89(x1), r1=109(y1), r2=208(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 109
LDI r2, 208
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
