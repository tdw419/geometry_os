; DESCRIPTION: Places a black line segment connecting (452, 178) to (386, 221).
; PLAN: r0=452(x1), r1=178(y1), r2=386(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 178
LDI r2, 386
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
