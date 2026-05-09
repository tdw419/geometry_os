; DESCRIPTION: Draws a yellow line from (143, 52) to (235, 128).
; PLAN: r0=143(x1), r1=52(y1), r2=235(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 52
LDI r2, 235
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
