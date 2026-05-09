; DESCRIPTION: Renders a cyan line between points (417, 18) and (172, 159).
; PLAN: r0=417(x1), r1=18(y1), r2=172(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 18
LDI r2, 172
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
