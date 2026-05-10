; DESCRIPTION: Renders a yellow line between points (315, 131) and (324, 187).
; PLAN: r0=315(x1), r1=131(y1), r2=324(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 131
LDI r2, 324
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
