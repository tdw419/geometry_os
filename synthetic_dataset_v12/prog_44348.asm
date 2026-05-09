; DESCRIPTION: Draws a yellow line from (72, 245) to (330, 81).
; PLAN: r0=72(x1), r1=245(y1), r2=330(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 245
LDI r2, 330
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
