; DESCRIPTION: Draws a cyan line from (235, 63) to (282, 217).
; PLAN: r0=235(x1), r1=63(y1), r2=282(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 63
LDI r2, 282
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
