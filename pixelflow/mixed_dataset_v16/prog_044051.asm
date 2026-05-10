; DESCRIPTION: Draws a magenta line from (219, 45) to (199, 82).
; PLAN: r0=219(x1), r1=45(y1), r2=199(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 45
LDI r2, 199
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
