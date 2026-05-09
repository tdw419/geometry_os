; DESCRIPTION: Renders a yellow line between points (5, 30) and (198, 63).
; PLAN: r0=5(x1), r1=30(y1), r2=198(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 30
LDI r2, 198
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
