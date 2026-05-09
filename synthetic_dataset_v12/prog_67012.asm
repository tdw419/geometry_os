; DESCRIPTION: Renders a green line between points (46, 249) and (500, 185).
; PLAN: r0=46(x1), r1=249(y1), r2=500(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 249
LDI r2, 500
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
