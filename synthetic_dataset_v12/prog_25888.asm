; DESCRIPTION: Renders a yellow line between points (237, 238) and (328, 234).
; PLAN: r0=237(x1), r1=238(y1), r2=328(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 238
LDI r2, 328
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
