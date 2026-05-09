; DESCRIPTION: Places a yellow line segment connecting (95, 200) to (255, 91).
; PLAN: r0=95(x1), r1=200(y1), r2=255(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 200
LDI r2, 255
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
