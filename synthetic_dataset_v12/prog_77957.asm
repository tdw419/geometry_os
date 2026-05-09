; DESCRIPTION: Draws a green line from (402, 200) to (301, 235).
; PLAN: r0=402(x1), r1=200(y1), r2=301(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 200
LDI r2, 301
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
