; DESCRIPTION: Draws a green line from (148, 91) to (131, 21).
; PLAN: r0=148(x1), r1=91(y1), r2=131(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 91
LDI r2, 131
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
