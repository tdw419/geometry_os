; DESCRIPTION: Renders a green line between points (5, 52) and (30, 99).
; PLAN: r0=5(x1), r1=52(y1), r2=30(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 52
LDI r2, 30
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
