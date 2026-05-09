; DESCRIPTION: Places a blue line segment connecting (100, 140) to (386, 215).
; PLAN: r0=100(x1), r1=140(y1), r2=386(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 140
LDI r2, 386
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
