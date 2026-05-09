; DESCRIPTION: Draws a yellow line from (303, 64) to (45, 156).
; PLAN: r0=303(x1), r1=64(y1), r2=45(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 64
LDI r2, 45
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
