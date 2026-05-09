; DESCRIPTION: Places a magenta line segment connecting (98, 21) to (72, 38).
; PLAN: r0=98(x1), r1=21(y1), r2=72(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 21
LDI r2, 72
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
