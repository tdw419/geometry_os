; DESCRIPTION: Draws a green line from (326, 235) to (505, 74).
; PLAN: r0=326(x1), r1=235(y1), r2=505(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 235
LDI r2, 505
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
