; DESCRIPTION: Renders a red line between points (303, 5) and (369, 91).
; PLAN: r0=303(x1), r1=5(y1), r2=369(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 5
LDI r2, 369
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
