; DESCRIPTION: Places a magenta line segment connecting (179, 23) to (488, 91).
; PLAN: r0=179(x1), r1=23(y1), r2=488(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 23
LDI r2, 488
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
