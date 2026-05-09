; DESCRIPTION: Places a blue line segment connecting (347, 81) to (346, 138).
; PLAN: r0=347(x1), r1=81(y1), r2=346(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 81
LDI r2, 346
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
