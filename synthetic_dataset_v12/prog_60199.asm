; DESCRIPTION: Draws a yellow line from (70, 136) to (350, 166).
; PLAN: r0=70(x1), r1=136(y1), r2=350(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 136
LDI r2, 350
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
