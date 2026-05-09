; DESCRIPTION: Places a black line segment connecting (98, 195) to (104, 115).
; PLAN: r0=98(x1), r1=195(y1), r2=104(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 195
LDI r2, 104
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
