; DESCRIPTION: Draws a magenta line from (73, 103) to (156, 207).
; PLAN: r0=73(x1), r1=103(y1), r2=156(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 103
LDI r2, 156
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
