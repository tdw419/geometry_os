; DESCRIPTION: Renders a red line between points (433, 106) and (207, 229).
; PLAN: r0=433(x1), r1=106(y1), r2=207(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 106
LDI r2, 207
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
