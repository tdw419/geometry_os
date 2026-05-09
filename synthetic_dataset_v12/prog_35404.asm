; DESCRIPTION: Renders a cyan line between points (427, 131) and (3, 74).
; PLAN: r0=427(x1), r1=131(y1), r2=3(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 131
LDI r2, 3
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
