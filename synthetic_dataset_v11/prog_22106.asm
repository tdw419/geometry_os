; DESCRIPTION: Renders a yellow line between points (170, 141) and (215, 221).
; PLAN: r0=170(x1), r1=141(y1), r2=215(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 141
LDI r2, 215
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
