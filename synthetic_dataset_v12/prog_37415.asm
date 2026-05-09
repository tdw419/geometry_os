; DESCRIPTION: Places a blue line segment connecting (7, 131) to (346, 43).
; PLAN: r0=7(x1), r1=131(y1), r2=346(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 131
LDI r2, 346
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
