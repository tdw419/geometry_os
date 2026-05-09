; DESCRIPTION: Renders a yellow line between points (171, 158) and (356, 174).
; PLAN: r0=171(x1), r1=158(y1), r2=356(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 158
LDI r2, 356
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
