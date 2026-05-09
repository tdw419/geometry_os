; DESCRIPTION: Renders a yellow line between points (103, 50) and (161, 169).
; PLAN: r0=103(x1), r1=50(y1), r2=161(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 50
LDI r2, 161
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
