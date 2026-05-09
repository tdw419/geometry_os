; DESCRIPTION: Renders a yellow line between points (77, 215) and (462, 167).
; PLAN: r0=77(x1), r1=215(y1), r2=462(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 215
LDI r2, 462
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
