; DESCRIPTION: Renders a blue line between points (395, 207) and (317, 37).
; PLAN: r0=395(x1), r1=207(y1), r2=317(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 207
LDI r2, 317
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
