; DESCRIPTION: Renders a red line between points (314, 33) and (465, 221).
; PLAN: r0=314(x1), r1=33(y1), r2=465(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 33
LDI r2, 465
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
