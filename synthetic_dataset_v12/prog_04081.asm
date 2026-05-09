; DESCRIPTION: Draws a purple line from (300, 247) to (235, 59).
; PLAN: r0=300(x1), r1=247(y1), r2=235(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 247
LDI r2, 235
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
