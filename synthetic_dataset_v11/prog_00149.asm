; DESCRIPTION: Renders a green line between points (30, 13) and (12, 1).
; PLAN: r0=30(x1), r1=13(y1), r2=12(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 13
LDI r2, 12
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
