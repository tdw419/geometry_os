; DESCRIPTION: Draws a purple line from (235, 42) to (373, 249).
; PLAN: r0=235(x1), r1=42(y1), r2=373(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 42
LDI r2, 373
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
