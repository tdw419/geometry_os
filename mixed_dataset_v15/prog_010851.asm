; DESCRIPTION: Renders a red line between points (98, 103) and (229, 188).
; PLAN: r0=98(x1), r1=103(y1), r2=229(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 103
LDI r2, 229
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
