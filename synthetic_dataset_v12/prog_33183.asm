; DESCRIPTION: Places a magenta line segment connecting (429, 174) to (309, 98).
; PLAN: r0=429(x1), r1=174(y1), r2=309(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 174
LDI r2, 309
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
