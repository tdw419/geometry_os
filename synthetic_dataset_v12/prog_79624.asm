; DESCRIPTION: Places a black line segment connecting (19, 21) to (107, 168).
; PLAN: r0=19(x1), r1=21(y1), r2=107(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 21
LDI r2, 107
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
