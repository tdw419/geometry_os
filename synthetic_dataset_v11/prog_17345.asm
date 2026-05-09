; DESCRIPTION: Draws a red line from (139, 132) to (50, 225).
; PLAN: r0=139(x1), r1=132(y1), r2=50(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 132
LDI r2, 50
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
