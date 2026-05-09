; DESCRIPTION: Renders a orange line between points (21, 86) and (422, 230).
; PLAN: r0=21(x1), r1=86(y1), r2=422(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 86
LDI r2, 422
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
