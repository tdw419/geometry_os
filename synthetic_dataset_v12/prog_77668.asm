; DESCRIPTION: Places a magenta line segment connecting (268, 252) to (387, 96).
; PLAN: r0=268(x1), r1=252(y1), r2=387(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 252
LDI r2, 387
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
