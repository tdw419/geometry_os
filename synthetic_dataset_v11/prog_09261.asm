; DESCRIPTION: Draws a green line from (1, 12) to (136, 150).
; PLAN: r0=1(x1), r1=12(y1), r2=136(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 12
LDI r2, 136
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
