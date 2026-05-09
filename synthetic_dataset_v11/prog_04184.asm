; DESCRIPTION: Renders a green line between points (17, 149) and (229, 71).
; PLAN: r0=17(x1), r1=149(y1), r2=229(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 149
LDI r2, 229
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
