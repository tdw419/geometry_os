; DESCRIPTION: Renders a green line between points (186, 21) and (332, 243).
; PLAN: r0=186(x1), r1=21(y1), r2=332(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 21
LDI r2, 332
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
