; DESCRIPTION: Places a orange line segment connecting (398, 40) to (392, 195).
; PLAN: r0=398(x1), r1=40(y1), r2=392(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 40
LDI r2, 392
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
