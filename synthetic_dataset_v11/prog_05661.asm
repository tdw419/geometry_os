; DESCRIPTION: Renders a purple line between points (31, 58) and (16, 214).
; PLAN: r0=31(x1), r1=58(y1), r2=16(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 58
LDI r2, 16
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
