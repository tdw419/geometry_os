; DESCRIPTION: Places a black line segment connecting (215, 50) to (208, 200).
; PLAN: r0=215(x1), r1=50(y1), r2=208(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 50
LDI r2, 208
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
