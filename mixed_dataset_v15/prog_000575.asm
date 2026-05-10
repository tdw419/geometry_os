; DESCRIPTION: Draws a green line from (4, 66) to (196, 212).
; PLAN: r0=4(x1), r1=66(y1), r2=196(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 66
LDI r2, 196
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
