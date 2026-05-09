; DESCRIPTION: Places a blue line segment connecting (80, 46) to (5, 103).
; PLAN: r0=80(x1), r1=46(y1), r2=5(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 46
LDI r2, 5
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
