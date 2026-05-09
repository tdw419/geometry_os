; DESCRIPTION: Places a yellow line segment connecting (178, 189) to (83, 210).
; PLAN: r0=178(x1), r1=189(y1), r2=83(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 189
LDI r2, 83
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
