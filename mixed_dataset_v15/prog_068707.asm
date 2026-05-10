; DESCRIPTION: Places a black line segment connecting (121, 225) to (3, 115).
; PLAN: r0=121(x1), r1=225(y1), r2=3(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 225
LDI r2, 3
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
