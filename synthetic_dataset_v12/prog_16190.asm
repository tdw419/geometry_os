; DESCRIPTION: Renders a blue line between points (197, 131) and (405, 3).
; PLAN: r0=197(x1), r1=131(y1), r2=405(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 131
LDI r2, 405
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
