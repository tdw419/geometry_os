; DESCRIPTION: Places a yellow line segment connecting (241, 63) to (264, 125).
; PLAN: r0=241(x1), r1=63(y1), r2=264(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 63
LDI r2, 264
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
