; DESCRIPTION: Draws a magenta line from (433, 226) to (73, 68).
; PLAN: r0=433(x1), r1=226(y1), r2=73(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 226
LDI r2, 73
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
