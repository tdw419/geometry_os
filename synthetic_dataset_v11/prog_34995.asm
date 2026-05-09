; DESCRIPTION: Draws a green line from (50, 15) to (174, 155).
; PLAN: r0=50(x1), r1=15(y1), r2=174(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 15
LDI r2, 174
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
