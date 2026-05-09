; DESCRIPTION: Draws a yellow line from (396, 176) to (179, 103).
; PLAN: r0=396(x1), r1=176(y1), r2=179(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 176
LDI r2, 179
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
