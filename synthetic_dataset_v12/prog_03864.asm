; DESCRIPTION: Renders a yellow line between points (301, 55) and (207, 200).
; PLAN: r0=301(x1), r1=55(y1), r2=207(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 55
LDI r2, 207
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
