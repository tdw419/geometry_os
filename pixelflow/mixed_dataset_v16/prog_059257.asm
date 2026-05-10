; DESCRIPTION: Renders a green line between points (36, 129) and (185, 86).
; PLAN: r0=36(x1), r1=129(y1), r2=185(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 129
LDI r2, 185
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
