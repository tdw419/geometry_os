; DESCRIPTION: Places a black line segment connecting (36, 134) to (70, 120).
; PLAN: r0=36(x1), r1=134(y1), r2=70(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 134
LDI r2, 70
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
