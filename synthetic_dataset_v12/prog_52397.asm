; DESCRIPTION: Renders a magenta line between points (437, 58) and (74, 167).
; PLAN: r0=437(x1), r1=58(y1), r2=74(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 58
LDI r2, 74
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
