; DESCRIPTION: Renders a yellow line between points (215, 204) and (61, 110).
; PLAN: r0=215(x1), r1=204(y1), r2=61(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 204
LDI r2, 61
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
