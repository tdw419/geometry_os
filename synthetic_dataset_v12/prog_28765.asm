; DESCRIPTION: Places a blue line segment connecting (398, 39) to (483, 239).
; PLAN: r0=398(x1), r1=39(y1), r2=483(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 39
LDI r2, 483
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
