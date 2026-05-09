; DESCRIPTION: Renders a magenta line between points (94, 51) and (108, 50).
; PLAN: r0=94(x1), r1=51(y1), r2=108(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 51
LDI r2, 108
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
