; DESCRIPTION: Renders a red line between points (236, 47) and (442, 13).
; PLAN: r0=236(x1), r1=47(y1), r2=442(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 47
LDI r2, 442
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
