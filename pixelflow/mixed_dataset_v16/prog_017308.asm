; DESCRIPTION: Renders a yellow line between points (186, 98) and (338, 193).
; PLAN: r0=186(x1), r1=98(y1), r2=338(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 98
LDI r2, 338
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
