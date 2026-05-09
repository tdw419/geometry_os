; DESCRIPTION: Places a black line segment connecting (296, 45) to (65, 16).
; PLAN: r0=296(x1), r1=45(y1), r2=65(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 45
LDI r2, 65
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
