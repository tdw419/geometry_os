; DESCRIPTION: Renders a yellow line segment connecting (392, 45) to (6, 40).
; PLAN: r0=392(x1), r1=45(y1), r2=6(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 45
LDI r2, 6
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
