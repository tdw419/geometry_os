; DESCRIPTION: Draws a green line from (91, 233) to (144, 11).
; PLAN: r0=91(x1), r1=233(y1), r2=144(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 233
LDI r2, 144
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
