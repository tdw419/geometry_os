; DESCRIPTION: Places a red line segment connecting (291, 208) to (63, 89).
; PLAN: r0=291(x1), r1=208(y1), r2=63(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 208
LDI r2, 63
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
