; DESCRIPTION: Draws a yellow line from (113, 19) to (60, 235).
; PLAN: r0=113(x1), r1=19(y1), r2=60(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 19
LDI r2, 60
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
