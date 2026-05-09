; DESCRIPTION: Renders a magenta line between points (35, 182) and (74, 233).
; PLAN: r0=35(x1), r1=182(y1), r2=74(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 182
LDI r2, 74
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
