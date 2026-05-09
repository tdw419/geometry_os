; DESCRIPTION: Draws a yellow line from (91, 127) to (196, 202).
; PLAN: r0=91(x1), r1=127(y1), r2=196(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 127
LDI r2, 196
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
