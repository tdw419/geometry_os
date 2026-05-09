; DESCRIPTION: Renders a white line between points (422, 149) and (355, 229).
; PLAN: r0=422(x1), r1=149(y1), r2=355(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 149
LDI r2, 355
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
