; DESCRIPTION: Renders a green line between points (473, 11) and (145, 150).
; PLAN: r0=473(x1), r1=11(y1), r2=145(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 11
LDI r2, 145
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
