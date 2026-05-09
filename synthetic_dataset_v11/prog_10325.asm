; DESCRIPTION: Draws a white line from (136, 235) to (174, 225).
; PLAN: r0=136(x1), r1=235(y1), r2=174(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 235
LDI r2, 174
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
