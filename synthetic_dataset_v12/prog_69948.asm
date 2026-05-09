; DESCRIPTION: Places a yellow line segment connecting (89, 46) to (226, 239).
; PLAN: r0=89(x1), r1=46(y1), r2=226(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 46
LDI r2, 226
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
