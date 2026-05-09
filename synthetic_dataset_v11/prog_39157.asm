; DESCRIPTION: Renders a magenta line between points (234, 103) and (80, 33).
; PLAN: r0=234(x1), r1=103(y1), r2=80(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 103
LDI r2, 80
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
