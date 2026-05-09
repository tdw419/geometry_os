; DESCRIPTION: Renders a cyan line between points (17, 229) and (241, 133).
; PLAN: r0=17(x1), r1=229(y1), r2=241(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 229
LDI r2, 241
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
