; DESCRIPTION: Renders a red line between points (136, 197) and (229, 0).
; PLAN: r0=136(x1), r1=197(y1), r2=229(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 197
LDI r2, 229
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
