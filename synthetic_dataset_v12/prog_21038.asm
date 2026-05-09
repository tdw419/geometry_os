; DESCRIPTION: Renders a yellow line between points (20, 145) and (263, 50).
; PLAN: r0=20(x1), r1=145(y1), r2=263(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 145
LDI r2, 263
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
