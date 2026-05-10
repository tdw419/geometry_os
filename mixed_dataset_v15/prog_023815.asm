; DESCRIPTION: Renders a magenta line between points (390, 86) and (418, 197).
; PLAN: r0=390(x1), r1=86(y1), r2=418(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 86
LDI r2, 418
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
