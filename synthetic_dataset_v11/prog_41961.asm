; DESCRIPTION: Draws a green line from (235, 148) to (249, 56).
; PLAN: r0=235(x1), r1=148(y1), r2=249(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 148
LDI r2, 249
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
