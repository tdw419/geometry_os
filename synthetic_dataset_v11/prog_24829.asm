; DESCRIPTION: Renders a cyan line between points (123, 159) and (185, 89).
; PLAN: r0=123(x1), r1=159(y1), r2=185(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 159
LDI r2, 185
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
