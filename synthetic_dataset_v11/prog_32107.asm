; DESCRIPTION: Renders a green line between points (180, 57) and (129, 200).
; PLAN: r0=180(x1), r1=57(y1), r2=129(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 57
LDI r2, 129
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
