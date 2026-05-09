; DESCRIPTION: Draws a green line from (328, 2) to (212, 196).
; PLAN: r0=328(x1), r1=2(y1), r2=212(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 2
LDI r2, 212
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
