; DESCRIPTION: Renders a purple line between points (59, 129) and (94, 187).
; PLAN: r0=59(x1), r1=129(y1), r2=94(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 129
LDI r2, 94
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
