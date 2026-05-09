; DESCRIPTION: Renders a magenta line between points (208, 49) and (182, 197).
; PLAN: r0=208(x1), r1=49(y1), r2=182(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 49
LDI r2, 182
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
