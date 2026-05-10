; DESCRIPTION: Draws a red line from (111, 31) to (307, 185).
; PLAN: r0=111(x1), r1=31(y1), r2=307(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 31
LDI r2, 307
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
