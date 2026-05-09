; DESCRIPTION: Draws a magenta line from (117, 45) to (131, 181).
; PLAN: r0=117(x1), r1=45(y1), r2=131(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 45
LDI r2, 131
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
