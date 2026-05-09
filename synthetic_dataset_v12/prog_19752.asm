; DESCRIPTION: Places a black line segment connecting (82, 195) to (464, 105).
; PLAN: r0=82(x1), r1=195(y1), r2=464(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 195
LDI r2, 464
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
