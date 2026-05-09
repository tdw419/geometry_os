; DESCRIPTION: Renders a green line between points (324, 229) and (393, 89).
; PLAN: r0=324(x1), r1=229(y1), r2=393(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 229
LDI r2, 393
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
