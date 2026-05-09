; DESCRIPTION: Draws a magenta line from (66, 227) to (120, 215).
; PLAN: r0=66(x1), r1=227(y1), r2=120(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 227
LDI r2, 120
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
