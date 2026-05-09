; DESCRIPTION: Draws a yellow line from (250, 52) to (16, 166).
; PLAN: r0=250(x1), r1=52(y1), r2=16(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 52
LDI r2, 16
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
