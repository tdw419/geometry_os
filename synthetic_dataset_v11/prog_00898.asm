; DESCRIPTION: Draws a yellow line from (196, 100) to (40, 27).
; PLAN: r0=196(x1), r1=100(y1), r2=40(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 100
LDI r2, 40
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
