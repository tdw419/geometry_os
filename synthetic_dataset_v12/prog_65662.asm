; DESCRIPTION: Places a black line segment connecting (150, 229) to (35, 114).
; PLAN: r0=150(x1), r1=229(y1), r2=35(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 229
LDI r2, 35
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
