; DESCRIPTION: Renders a black line between points (220, 13) and (111, 91).
; PLAN: r0=220(x1), r1=13(y1), r2=111(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 13
LDI r2, 111
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
