; DESCRIPTION: Draws a yellow line from (402, 103) to (68, 74).
; PLAN: r0=402(x1), r1=103(y1), r2=68(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 103
LDI r2, 68
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
