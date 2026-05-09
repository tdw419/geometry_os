; DESCRIPTION: Places a magenta line segment connecting (121, 87) to (160, 91).
; PLAN: r0=121(x1), r1=87(y1), r2=160(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 87
LDI r2, 160
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
