; DESCRIPTION: Places a black line segment connecting (404, 84) to (220, 69).
; PLAN: r0=404(x1), r1=84(y1), r2=220(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 84
LDI r2, 220
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
