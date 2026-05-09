; DESCRIPTION: Renders a green line between points (36, 45) and (124, 135).
; PLAN: r0=36(x1), r1=45(y1), r2=124(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 45
LDI r2, 124
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
