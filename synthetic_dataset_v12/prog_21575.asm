; DESCRIPTION: Places a black line segment connecting (79, 54) to (253, 91).
; PLAN: r0=79(x1), r1=54(y1), r2=253(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 54
LDI r2, 253
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
