; DESCRIPTION: Renders a red line between points (273, 227) and (480, 207).
; PLAN: r0=273(x1), r1=227(y1), r2=480(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 227
LDI r2, 480
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
