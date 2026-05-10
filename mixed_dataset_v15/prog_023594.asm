; DESCRIPTION: Renders a green line between points (220, 25) and (223, 131).
; PLAN: r0=220(x1), r1=25(y1), r2=223(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 25
LDI r2, 223
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
