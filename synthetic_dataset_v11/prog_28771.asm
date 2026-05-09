; DESCRIPTION: Draws a green line from (144, 106) to (17, 220).
; PLAN: r0=144(x1), r1=106(y1), r2=17(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 106
LDI r2, 17
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
