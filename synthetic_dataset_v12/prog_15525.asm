; DESCRIPTION: Places a black line segment connecting (410, 220) to (159, 105).
; PLAN: r0=410(x1), r1=220(y1), r2=159(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 220
LDI r2, 159
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
