; DESCRIPTION: Places a magenta line segment connecting (106, 115) to (125, 95).
; PLAN: r0=106(x1), r1=115(y1), r2=125(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 115
LDI r2, 125
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
