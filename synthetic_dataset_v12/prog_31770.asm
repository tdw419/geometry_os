; DESCRIPTION: Places a yellow line segment connecting (286, 251) to (95, 210).
; PLAN: r0=286(x1), r1=251(y1), r2=95(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 251
LDI r2, 95
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
