; DESCRIPTION: Draws a magenta line from (221, 21) to (275, 112).
; PLAN: r0=221(x1), r1=21(y1), r2=275(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 21
LDI r2, 275
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
