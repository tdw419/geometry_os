; DESCRIPTION: Places a purple line segment connecting (464, 211) to (125, 125).
; PLAN: r0=464(x1), r1=211(y1), r2=125(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 211
LDI r2, 125
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
