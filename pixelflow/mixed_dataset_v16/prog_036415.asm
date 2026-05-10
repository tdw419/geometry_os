; DESCRIPTION: Draws a magenta line from (267, 245) to (200, 235).
; PLAN: r0=267(x1), r1=245(y1), r2=200(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 245
LDI r2, 200
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
