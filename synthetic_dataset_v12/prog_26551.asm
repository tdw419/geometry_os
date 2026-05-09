; DESCRIPTION: Renders a yellow line between points (159, 208) and (439, 236).
; PLAN: r0=159(x1), r1=208(y1), r2=439(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 208
LDI r2, 439
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
