; DESCRIPTION: Draws a yellow line from (144, 106) to (235, 63).
; PLAN: r0=144(x1), r1=106(y1), r2=235(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 106
LDI r2, 235
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
