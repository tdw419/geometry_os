; DESCRIPTION: Renders a green line between points (209, 104) and (73, 223).
; PLAN: r0=209(x1), r1=104(y1), r2=73(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 104
LDI r2, 73
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
