; DESCRIPTION: Renders a red line between points (422, 167) and (231, 136).
; PLAN: r0=422(x1), r1=167(y1), r2=231(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 167
LDI r2, 231
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
