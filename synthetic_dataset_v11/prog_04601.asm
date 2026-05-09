; DESCRIPTION: Draws a green line from (103, 155) to (196, 21).
; PLAN: r0=103(x1), r1=155(y1), r2=196(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 155
LDI r2, 196
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
