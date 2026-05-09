; DESCRIPTION: Draws a red line from (98, 159) to (416, 134).
; PLAN: r0=98(x1), r1=159(y1), r2=416(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 159
LDI r2, 416
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
