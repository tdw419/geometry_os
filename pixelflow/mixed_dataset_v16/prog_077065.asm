; DESCRIPTION: Draws a yellow line from (91, 19) to (396, 246).
; PLAN: r0=91(x1), r1=19(y1), r2=396(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 19
LDI r2, 396
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
