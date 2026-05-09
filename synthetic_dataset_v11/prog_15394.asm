; DESCRIPTION: Draws a yellow line from (95, 159) to (60, 127).
; PLAN: r0=95(x1), r1=159(y1), r2=60(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 159
LDI r2, 60
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
