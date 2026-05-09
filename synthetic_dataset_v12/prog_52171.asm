; DESCRIPTION: Renders a red line between points (430, 174) and (210, 214).
; PLAN: r0=430(x1), r1=174(y1), r2=210(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 174
LDI r2, 210
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
