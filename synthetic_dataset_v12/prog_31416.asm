; DESCRIPTION: Renders a red line between points (430, 231) and (293, 232).
; PLAN: r0=430(x1), r1=231(y1), r2=293(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 231
LDI r2, 293
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
