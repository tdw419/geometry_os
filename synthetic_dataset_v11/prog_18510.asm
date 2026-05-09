; DESCRIPTION: Renders a cyan line between points (98, 184) and (6, 45).
; PLAN: r0=98(x1), r1=184(y1), r2=6(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 184
LDI r2, 6
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
