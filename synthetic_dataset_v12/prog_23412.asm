; DESCRIPTION: Places a black line segment connecting (200, 17) to (487, 146).
; PLAN: r0=200(x1), r1=17(y1), r2=487(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 17
LDI r2, 487
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
