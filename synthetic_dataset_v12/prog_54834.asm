; DESCRIPTION: Renders a red line between points (186, 181) and (411, 253).
; PLAN: r0=186(x1), r1=181(y1), r2=411(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 181
LDI r2, 411
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
