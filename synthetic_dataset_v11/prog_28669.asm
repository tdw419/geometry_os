; DESCRIPTION: Renders a red line between points (221, 174) and (111, 174).
; PLAN: r0=221(x1), r1=174(y1), r2=111(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 174
LDI r2, 111
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
