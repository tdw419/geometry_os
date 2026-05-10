; DESCRIPTION: Renders a cyan line between points (216, 131) and (37, 58).
; PLAN: r0=216(x1), r1=131(y1), r2=37(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 131
LDI r2, 37
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
