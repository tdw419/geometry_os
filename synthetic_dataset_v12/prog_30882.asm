; DESCRIPTION: Places a purple line segment connecting (460, 150) to (310, 3).
; PLAN: r0=460(x1), r1=150(y1), r2=310(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 150
LDI r2, 310
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
