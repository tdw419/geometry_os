; DESCRIPTION: Renders a yellow line between points (79, 90) and (234, 63).
; PLAN: r0=79(x1), r1=90(y1), r2=234(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 90
LDI r2, 234
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
