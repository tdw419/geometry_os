; DESCRIPTION: Places a black line segment connecting (263, 98) to (7, 220).
; PLAN: r0=263(x1), r1=98(y1), r2=7(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 98
LDI r2, 7
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
