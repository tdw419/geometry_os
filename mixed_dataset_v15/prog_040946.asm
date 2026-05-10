; DESCRIPTION: Places a blue line segment connecting (292, 152) to (108, 26).
; PLAN: r0=292(x1), r1=152(y1), r2=108(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 152
LDI r2, 108
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
