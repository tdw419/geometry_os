; DESCRIPTION: Renders a green line between points (105, 23) and (73, 91).
; PLAN: r0=105(x1), r1=23(y1), r2=73(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 23
LDI r2, 73
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
