; DESCRIPTION: Places a white line segment connecting (347, 220) to (58, 125).
; PLAN: r0=347(x1), r1=220(y1), r2=58(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 220
LDI r2, 58
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
