; DESCRIPTION: Renders a cyan line between points (478, 195) and (369, 52).
; PLAN: r0=478(x1), r1=195(y1), r2=369(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 195
LDI r2, 369
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
