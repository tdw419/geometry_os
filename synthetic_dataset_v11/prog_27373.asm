; DESCRIPTION: Renders a red line between points (171, 141) and (71, 241).
; PLAN: r0=171(x1), r1=141(y1), r2=71(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 141
LDI r2, 71
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
