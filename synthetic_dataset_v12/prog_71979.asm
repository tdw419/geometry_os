; DESCRIPTION: Draws a magenta line from (287, 223) to (450, 219).
; PLAN: r0=287(x1), r1=223(y1), r2=450(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 223
LDI r2, 450
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
