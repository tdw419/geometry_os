; DESCRIPTION: Draws a yellow line from (102, 195) to (189, 5).
; PLAN: r0=102(x1), r1=195(y1), r2=189(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 195
LDI r2, 189
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
