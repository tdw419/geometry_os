; DESCRIPTION: Places a magenta line segment connecting (445, 113) to (220, 110).
; PLAN: r0=445(x1), r1=113(y1), r2=220(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 113
LDI r2, 220
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
