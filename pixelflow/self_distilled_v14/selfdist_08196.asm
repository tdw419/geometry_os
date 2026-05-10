; DESCRIPTION: Draws a red line from (235, 185) to (69, 103).
; PLAN: r0=235(x1), r1=185(y1), r2=69(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 185
LDI r2, 69
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
