; DESCRIPTION: Places a black line segment connecting (377, 180) to (340, 246).
; PLAN: r0=377(x1), r1=180(y1), r2=340(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 180
LDI r2, 340
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
