; DESCRIPTION: Places a green line segment connecting (132, 125) to (111, 4).
; PLAN: r0=132(x1), r1=125(y1), r2=111(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 125
LDI r2, 111
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
