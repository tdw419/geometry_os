; DESCRIPTION: Places a black line segment connecting (362, 178) to (398, 50).
; PLAN: r0=362(x1), r1=178(y1), r2=398(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 178
LDI r2, 398
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
