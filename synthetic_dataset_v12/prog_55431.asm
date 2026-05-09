; DESCRIPTION: Renders a cyan line between points (97, 193) and (369, 170).
; PLAN: r0=97(x1), r1=193(y1), r2=369(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 193
LDI r2, 369
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
