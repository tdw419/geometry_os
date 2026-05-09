; DESCRIPTION: Draws a yellow line from (150, 56) to (91, 28).
; PLAN: r0=150(x1), r1=56(y1), r2=91(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 56
LDI r2, 91
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
