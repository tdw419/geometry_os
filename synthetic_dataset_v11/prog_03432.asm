; DESCRIPTION: Draws a red line from (225, 140) to (181, 124).
; PLAN: r0=225(x1), r1=140(y1), r2=181(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 140
LDI r2, 181
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
