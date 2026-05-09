; DESCRIPTION: Draws a red line from (433, 17) to (307, 140).
; PLAN: r0=433(x1), r1=17(y1), r2=307(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 17
LDI r2, 307
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
