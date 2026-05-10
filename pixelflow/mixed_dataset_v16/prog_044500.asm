; DESCRIPTION: Places a magenta line segment connecting (295, 101) to (76, 229).
; PLAN: r0=295(x1), r1=101(y1), r2=76(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 101
LDI r2, 76
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
