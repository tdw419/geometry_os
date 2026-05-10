; DESCRIPTION: Renders a magenta line between points (340, 6) and (449, 35).
; PLAN: r0=340(x1), r1=6(y1), r2=449(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 6
LDI r2, 449
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
