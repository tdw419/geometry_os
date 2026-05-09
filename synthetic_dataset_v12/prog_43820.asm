; DESCRIPTION: Draws a orange line from (235, 120) to (402, 128).
; PLAN: r0=235(x1), r1=120(y1), r2=402(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 120
LDI r2, 402
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
