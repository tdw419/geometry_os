; DESCRIPTION: Places a white line segment connecting (433, 111) to (325, 1).
; PLAN: r0=433(x1), r1=111(y1), r2=325(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 111
LDI r2, 325
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
