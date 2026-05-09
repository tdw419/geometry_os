; DESCRIPTION: Renders a magenta line between points (215, 136) and (162, 241).
; PLAN: r0=215(x1), r1=136(y1), r2=162(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 136
LDI r2, 162
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
