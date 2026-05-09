; DESCRIPTION: Places a yellow line segment connecting (393, 43) to (262, 91).
; PLAN: r0=393(x1), r1=43(y1), r2=262(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 43
LDI r2, 262
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
