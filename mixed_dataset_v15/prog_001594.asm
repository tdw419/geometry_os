; DESCRIPTION: Renders a red line between points (33, 141) and (236, 44).
; PLAN: r0=33(x1), r1=141(y1), r2=236(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 141
LDI r2, 236
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
