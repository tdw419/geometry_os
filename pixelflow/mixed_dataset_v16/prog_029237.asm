; DESCRIPTION: Renders a cyan line between points (149, 123) and (449, 105).
; PLAN: r0=149(x1), r1=123(y1), r2=449(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 123
LDI r2, 449
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
