; DESCRIPTION: Draws a magenta line from (352, 8) to (362, 148).
; PLAN: r0=352(x1), r1=8(y1), r2=362(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 8
LDI r2, 362
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
