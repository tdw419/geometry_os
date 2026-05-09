; DESCRIPTION: Renders a red line between points (18, 198) and (243, 22).
; PLAN: r0=18(x1), r1=198(y1), r2=243(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 198
LDI r2, 243
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
