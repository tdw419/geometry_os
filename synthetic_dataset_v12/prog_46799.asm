; DESCRIPTION: Places a blue line segment connecting (284, 15) to (381, 2).
; PLAN: r0=284(x1), r1=15(y1), r2=381(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 15
LDI r2, 381
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
