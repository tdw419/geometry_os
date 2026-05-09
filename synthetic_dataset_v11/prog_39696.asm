; DESCRIPTION: Draws a magenta line from (25, 116) to (235, 65).
; PLAN: r0=25(x1), r1=116(y1), r2=235(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 116
LDI r2, 235
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
