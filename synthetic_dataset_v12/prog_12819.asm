; DESCRIPTION: Renders a red line between points (71, 47) and (259, 234).
; PLAN: r0=71(x1), r1=47(y1), r2=259(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 47
LDI r2, 259
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
