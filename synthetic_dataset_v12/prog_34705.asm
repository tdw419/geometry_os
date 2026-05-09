; DESCRIPTION: Draws a magenta line from (212, 45) to (263, 187).
; PLAN: r0=212(x1), r1=45(y1), r2=263(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 45
LDI r2, 263
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
