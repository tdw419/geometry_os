; DESCRIPTION: Renders a black line between points (319, 229) and (509, 168).
; PLAN: r0=319(x1), r1=229(y1), r2=509(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 229
LDI r2, 509
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
