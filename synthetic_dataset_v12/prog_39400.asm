; DESCRIPTION: Renders a cyan line between points (260, 174) and (309, 241).
; PLAN: r0=260(x1), r1=174(y1), r2=309(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 174
LDI r2, 309
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
