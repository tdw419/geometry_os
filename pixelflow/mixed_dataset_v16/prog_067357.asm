; DESCRIPTION: Draws a red line from (270, 240) to (127, 122).
; PLAN: r0=270(x1), r1=240(y1), r2=127(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 240
LDI r2, 127
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
