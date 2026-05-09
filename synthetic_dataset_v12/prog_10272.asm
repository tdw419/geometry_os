; DESCRIPTION: Places a magenta line segment connecting (198, 93) to (101, 159).
; PLAN: r0=198(x1), r1=93(y1), r2=101(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 93
LDI r2, 101
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
