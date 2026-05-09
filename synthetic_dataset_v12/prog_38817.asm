; DESCRIPTION: Draws a magenta line from (275, 160) to (481, 229).
; PLAN: r0=275(x1), r1=160(y1), r2=481(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 160
LDI r2, 481
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
