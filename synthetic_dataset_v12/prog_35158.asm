; DESCRIPTION: Renders a red line between points (333, 238) and (473, 251).
; PLAN: r0=333(x1), r1=238(y1), r2=473(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 238
LDI r2, 473
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
