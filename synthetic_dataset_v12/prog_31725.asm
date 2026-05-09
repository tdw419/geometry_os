; DESCRIPTION: Draws a green line from (325, 166) to (7, 20).
; PLAN: r0=325(x1), r1=166(y1), r2=7(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 166
LDI r2, 7
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
