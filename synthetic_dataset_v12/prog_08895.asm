; DESCRIPTION: Places a magenta line segment connecting (126, 102) to (95, 76).
; PLAN: r0=126(x1), r1=102(y1), r2=95(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 102
LDI r2, 95
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
