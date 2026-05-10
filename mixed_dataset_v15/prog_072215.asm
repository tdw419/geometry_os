; DESCRIPTION: Renders a magenta line between points (162, 121) and (28, 234).
; PLAN: r0=162(x1), r1=121(y1), r2=28(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 121
LDI r2, 28
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
