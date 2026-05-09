; DESCRIPTION: Places a blue line segment connecting (9, 55) to (500, 174).
; PLAN: r0=9(x1), r1=55(y1), r2=500(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 55
LDI r2, 500
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
