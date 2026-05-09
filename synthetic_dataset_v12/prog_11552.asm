; DESCRIPTION: Places a black line segment connecting (367, 60) to (497, 132).
; PLAN: r0=367(x1), r1=60(y1), r2=497(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 60
LDI r2, 497
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
