; DESCRIPTION: Renders a green line between points (180, 54) and (322, 131).
; PLAN: r0=180(x1), r1=54(y1), r2=322(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 54
LDI r2, 322
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
