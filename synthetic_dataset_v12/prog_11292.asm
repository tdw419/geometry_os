; DESCRIPTION: Draws a purple line from (398, 40) to (333, 100).
; PLAN: r0=398(x1), r1=40(y1), r2=333(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 40
LDI r2, 333
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
