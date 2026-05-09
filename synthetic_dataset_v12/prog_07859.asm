; DESCRIPTION: Places a yellow line segment connecting (286, 113) to (293, 160).
; PLAN: r0=286(x1), r1=113(y1), r2=293(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 113
LDI r2, 293
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
