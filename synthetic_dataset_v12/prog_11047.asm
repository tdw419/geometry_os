; DESCRIPTION: Places a yellow line segment connecting (286, 216) to (368, 174).
; PLAN: r0=286(x1), r1=216(y1), r2=368(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 216
LDI r2, 368
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
