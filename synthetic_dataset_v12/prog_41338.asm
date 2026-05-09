; DESCRIPTION: Places a yellow line segment connecting (296, 93) to (400, 1).
; PLAN: r0=296(x1), r1=93(y1), r2=400(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 93
LDI r2, 400
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
