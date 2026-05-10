; DESCRIPTION: Draws a red line from (19, 157) to (290, 127).
; PLAN: r0=19(x1), r1=157(y1), r2=290(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 157
LDI r2, 290
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
