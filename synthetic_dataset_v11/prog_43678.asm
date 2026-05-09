; DESCRIPTION: Renders a green line between points (123, 39) and (237, 145).
; PLAN: r0=123(x1), r1=39(y1), r2=237(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 39
LDI r2, 237
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
