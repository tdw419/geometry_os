; DESCRIPTION: Places a blue line segment connecting (386, 77) to (18, 198).
; PLAN: r0=386(x1), r1=77(y1), r2=18(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 77
LDI r2, 18
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
