; DESCRIPTION: Places a magenta line segment connecting (18, 25) to (382, 38).
; PLAN: r0=18(x1), r1=25(y1), r2=382(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 25
LDI r2, 382
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
