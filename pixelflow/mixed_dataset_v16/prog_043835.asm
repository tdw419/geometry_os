; DESCRIPTION: Renders a red line between points (199, 6) and (441, 204).
; PLAN: r0=199(x1), r1=6(y1), r2=441(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 6
LDI r2, 441
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
