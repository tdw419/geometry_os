; DESCRIPTION: Renders a red line between points (71, 77) and (412, 134).
; PLAN: r0=71(x1), r1=77(y1), r2=412(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 77
LDI r2, 412
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
