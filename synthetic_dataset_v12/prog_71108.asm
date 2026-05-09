; DESCRIPTION: Renders a green line between points (305, 131) and (122, 145).
; PLAN: r0=305(x1), r1=131(y1), r2=122(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 131
LDI r2, 122
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
