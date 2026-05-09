; DESCRIPTION: Renders a red line between points (460, 207) and (204, 234).
; PLAN: r0=460(x1), r1=207(y1), r2=204(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 207
LDI r2, 204
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
