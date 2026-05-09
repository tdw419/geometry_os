; DESCRIPTION: Places a orange line segment connecting (398, 210) to (355, 200).
; PLAN: r0=398(x1), r1=210(y1), r2=355(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 210
LDI r2, 355
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
