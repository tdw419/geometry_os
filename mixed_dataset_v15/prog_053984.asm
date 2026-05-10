; DESCRIPTION: Renders a yellow line between points (45, 194) and (123, 63).
; PLAN: r0=45(x1), r1=194(y1), r2=123(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 194
LDI r2, 123
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
