; DESCRIPTION: Places a black line segment connecting (464, 239) to (13, 159).
; PLAN: r0=464(x1), r1=239(y1), r2=13(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 239
LDI r2, 13
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
