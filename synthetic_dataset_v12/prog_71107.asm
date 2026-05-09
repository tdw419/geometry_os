; DESCRIPTION: Places a black line segment connecting (98, 202) to (370, 87).
; PLAN: r0=98(x1), r1=202(y1), r2=370(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 202
LDI r2, 370
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
