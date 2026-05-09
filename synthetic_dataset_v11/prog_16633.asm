; DESCRIPTION: Renders a cyan line between points (139, 45) and (56, 100).
; PLAN: r0=139(x1), r1=45(y1), r2=56(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 45
LDI r2, 56
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
