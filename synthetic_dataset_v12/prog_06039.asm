; DESCRIPTION: Places a black line segment connecting (393, 125) to (452, 209).
; PLAN: r0=393(x1), r1=125(y1), r2=452(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 125
LDI r2, 452
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
