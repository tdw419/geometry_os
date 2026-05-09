; DESCRIPTION: Places a magenta line segment connecting (380, 9) to (11, 66).
; PLAN: r0=380(x1), r1=9(y1), r2=11(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 9
LDI r2, 11
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
