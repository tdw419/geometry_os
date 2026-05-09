; DESCRIPTION: Renders a red line between points (449, 243) and (433, 144).
; PLAN: r0=449(x1), r1=243(y1), r2=433(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 243
LDI r2, 433
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
