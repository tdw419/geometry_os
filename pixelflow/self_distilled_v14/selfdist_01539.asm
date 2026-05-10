; DESCRIPTION: Renders a green line segment connecting (172, 81) to (328, 91).
; PLAN: r0=172(x1), r1=81(y1), r2=328(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 81
LDI r2, 328
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
