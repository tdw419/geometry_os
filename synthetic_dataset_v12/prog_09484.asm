; DESCRIPTION: Renders a red line between points (433, 234) and (264, 3).
; PLAN: r0=433(x1), r1=234(y1), r2=264(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 234
LDI r2, 264
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
