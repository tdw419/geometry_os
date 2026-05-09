; DESCRIPTION: Draws a magenta line from (199, 103) to (469, 235).
; PLAN: r0=199(x1), r1=103(y1), r2=469(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 103
LDI r2, 469
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
