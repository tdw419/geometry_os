; DESCRIPTION: Draws a yellow line from (468, 21) to (396, 195).
; PLAN: r0=468(x1), r1=21(y1), r2=396(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 21
LDI r2, 396
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
