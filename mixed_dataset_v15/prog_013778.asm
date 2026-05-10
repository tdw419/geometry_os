; DESCRIPTION: Renders a magenta line between points (352, 30) and (131, 119).
; PLAN: r0=352(x1), r1=30(y1), r2=131(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 30
LDI r2, 131
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
