; DESCRIPTION: Renders a red line between points (165, 160) and (142, 150).
; PLAN: r0=165(x1), r1=160(y1), r2=142(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 160
LDI r2, 142
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
