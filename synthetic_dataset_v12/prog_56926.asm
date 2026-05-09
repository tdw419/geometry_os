; DESCRIPTION: Draws a yellow line from (120, 156) to (123, 195).
; PLAN: r0=120(x1), r1=156(y1), r2=123(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 156
LDI r2, 123
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
