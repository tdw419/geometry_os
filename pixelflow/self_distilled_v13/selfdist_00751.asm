; DESCRIPTION: Creates a vertical magenta gradient from black to magenta.
; PLAN: r0=9(x), r1=10(y), r2=1(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 10
LDI r2, 1
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
