; DESCRIPTION: Places a orange line segment connecting (297, 103) to (482, 51).
; PLAN: r0=297(x1), r1=103(y1), r2=482(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 103
LDI r2, 482
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
