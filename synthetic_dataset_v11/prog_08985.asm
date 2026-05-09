; DESCRIPTION: Renders a yellow line between points (248, 129) and (180, 94).
; PLAN: r0=248(x1), r1=129(y1), r2=180(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 129
LDI r2, 180
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
