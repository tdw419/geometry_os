; DESCRIPTION: Draws a yellow line from (254, 24) to (216, 91).
; PLAN: r0=254(x1), r1=24(y1), r2=216(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 24
LDI r2, 216
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
