; DESCRIPTION: Draws a red line from (52, 8) to (90, 39).
; PLAN: r0=52(x1), r1=8(y1), r2=90(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 8
LDI r2, 90
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
