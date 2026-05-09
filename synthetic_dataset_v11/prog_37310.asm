; DESCRIPTION: Draws a magenta line from (5, 52) to (86, 55).
; PLAN: r0=5(x1), r1=52(y1), r2=86(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 52
LDI r2, 86
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
