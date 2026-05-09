; DESCRIPTION: Renders a magenta line between points (429, 91) and (380, 254).
; PLAN: r0=429(x1), r1=91(y1), r2=380(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 91
LDI r2, 380
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
