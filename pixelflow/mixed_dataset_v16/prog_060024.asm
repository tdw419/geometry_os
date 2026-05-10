; DESCRIPTION: Renders a green line between points (302, 215) and (379, 188).
; PLAN: r0=302(x1), r1=215(y1), r2=379(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 215
LDI r2, 379
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
