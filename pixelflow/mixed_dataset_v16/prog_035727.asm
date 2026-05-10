; DESCRIPTION: Renders a purple line between points (507, 218) and (340, 236).
; PLAN: r0=507(x1), r1=218(y1), r2=340(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 218
LDI r2, 340
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
