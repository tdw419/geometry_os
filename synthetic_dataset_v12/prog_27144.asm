; DESCRIPTION: Places a yellow line segment connecting (434, 85) to (424, 193).
; PLAN: r0=434(x1), r1=85(y1), r2=424(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 85
LDI r2, 424
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
