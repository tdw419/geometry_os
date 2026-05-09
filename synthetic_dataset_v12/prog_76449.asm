; DESCRIPTION: Renders a green line between points (508, 153) and (220, 18).
; PLAN: r0=508(x1), r1=153(y1), r2=220(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 153
LDI r2, 220
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
