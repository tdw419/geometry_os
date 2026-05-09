; DESCRIPTION: Draws a green line from (72, 166) to (223, 156).
; PLAN: r0=72(x1), r1=166(y1), r2=223(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 166
LDI r2, 223
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
