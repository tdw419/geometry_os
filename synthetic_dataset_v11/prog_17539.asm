; DESCRIPTION: Renders a magenta line between points (254, 10) and (45, 55).
; PLAN: r0=254(x1), r1=10(y1), r2=45(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 10
LDI r2, 45
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
