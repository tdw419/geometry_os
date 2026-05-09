; DESCRIPTION: Renders a green line between points (77, 54) and (237, 214).
; PLAN: r0=77(x1), r1=54(y1), r2=237(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 54
LDI r2, 237
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
