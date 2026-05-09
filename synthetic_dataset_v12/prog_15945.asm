; DESCRIPTION: Draws a magenta line from (109, 204) to (358, 221).
; PLAN: r0=109(x1), r1=204(y1), r2=358(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 204
LDI r2, 358
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
