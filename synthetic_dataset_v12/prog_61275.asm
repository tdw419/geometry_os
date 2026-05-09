; DESCRIPTION: Renders a green line between points (353, 64) and (266, 234).
; PLAN: r0=353(x1), r1=64(y1), r2=266(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 64
LDI r2, 266
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
