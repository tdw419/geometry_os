; DESCRIPTION: Draws a green line from (2, 30) to (20, 101).
; PLAN: r0=2(x1), r1=30(y1), r2=20(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 30
LDI r2, 20
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
