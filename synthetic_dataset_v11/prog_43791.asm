; DESCRIPTION: Draws a white line from (137, 195) to (235, 36).
; PLAN: r0=137(x1), r1=195(y1), r2=235(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 195
LDI r2, 235
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
