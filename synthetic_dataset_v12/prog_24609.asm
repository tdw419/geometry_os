; DESCRIPTION: Renders a cyan line between points (117, 75) and (390, 149).
; PLAN: r0=117(x1), r1=75(y1), r2=390(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 75
LDI r2, 390
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
