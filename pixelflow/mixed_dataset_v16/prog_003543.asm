; DESCRIPTION: Places a magenta line segment connecting (287, 199) to (281, 38).
; PLAN: r0=287(x1), r1=199(y1), r2=281(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 199
LDI r2, 281
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
