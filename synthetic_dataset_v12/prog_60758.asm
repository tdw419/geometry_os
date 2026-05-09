; DESCRIPTION: Renders a cyan line between points (377, 153) and (7, 49).
; PLAN: r0=377(x1), r1=153(y1), r2=7(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 153
LDI r2, 7
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
