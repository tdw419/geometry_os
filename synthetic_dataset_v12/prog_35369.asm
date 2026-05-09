; DESCRIPTION: Renders a magenta line between points (50, 52) and (288, 98).
; PLAN: r0=50(x1), r1=52(y1), r2=288(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 52
LDI r2, 288
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
