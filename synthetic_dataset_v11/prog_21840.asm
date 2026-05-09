; DESCRIPTION: Renders a red line between points (185, 80) and (221, 231).
; PLAN: r0=185(x1), r1=80(y1), r2=221(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 80
LDI r2, 221
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
