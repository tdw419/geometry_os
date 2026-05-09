; DESCRIPTION: Draws a red line from (310, 187) to (183, 158).
; PLAN: r0=310(x1), r1=187(y1), r2=183(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 187
LDI r2, 183
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
