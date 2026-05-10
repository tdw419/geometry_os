; DESCRIPTION: Renders a yellow line between points (223, 161) and (352, 169).
; PLAN: r0=223(x1), r1=161(y1), r2=352(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 161
LDI r2, 352
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
