; DESCRIPTION: Renders a green line between points (389, 161) and (190, 132).
; PLAN: r0=389(x1), r1=161(y1), r2=190(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 161
LDI r2, 190
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
