; DESCRIPTION: Renders a cyan line between points (208, 199) and (144, 41).
; PLAN: r0=208(x1), r1=199(y1), r2=144(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 199
LDI r2, 144
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
