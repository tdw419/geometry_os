; DESCRIPTION: Draws a magenta line from (294, 91) to (45, 44).
; PLAN: r0=294(x1), r1=91(y1), r2=45(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 91
LDI r2, 45
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
