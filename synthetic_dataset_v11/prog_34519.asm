; DESCRIPTION: Places a yellow line segment connecting (237, 9) to (165, 125).
; PLAN: r0=237(x1), r1=9(y1), r2=165(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 9
LDI r2, 165
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
