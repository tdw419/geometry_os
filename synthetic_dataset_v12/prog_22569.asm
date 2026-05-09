; DESCRIPTION: Renders a magenta line between points (349, 36) and (342, 132).
; PLAN: r0=349(x1), r1=36(y1), r2=342(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 36
LDI r2, 342
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
