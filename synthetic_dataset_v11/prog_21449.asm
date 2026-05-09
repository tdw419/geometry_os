; DESCRIPTION: Renders a yellow line between points (219, 229) and (86, 204).
; PLAN: r0=219(x1), r1=229(y1), r2=86(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 229
LDI r2, 86
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
