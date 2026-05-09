; DESCRIPTION: Places a magenta line segment connecting (45, 164) to (66, 43).
; PLAN: r0=45(x1), r1=164(y1), r2=66(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 164
LDI r2, 66
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
