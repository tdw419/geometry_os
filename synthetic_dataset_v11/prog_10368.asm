; DESCRIPTION: Draws a red line from (111, 207) to (125, 4).
; PLAN: r0=111(x1), r1=207(y1), r2=125(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 207
LDI r2, 125
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
