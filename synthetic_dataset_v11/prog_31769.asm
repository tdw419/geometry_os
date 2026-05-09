; DESCRIPTION: Draws a yellow line from (235, 104) to (235, 50).
; PLAN: r0=235(x1), r1=104(y1), r2=235(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 104
LDI r2, 235
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
