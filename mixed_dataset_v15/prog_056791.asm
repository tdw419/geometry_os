; DESCRIPTION: Renders a white line between points (94, 127) and (204, 12).
; PLAN: r0=94(x1), r1=127(y1), r2=204(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 127
LDI r2, 204
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
