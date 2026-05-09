; DESCRIPTION: Draws a yellow line from (324, 168) to (10, 84).
; PLAN: r0=324(x1), r1=168(y1), r2=10(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 168
LDI r2, 10
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
