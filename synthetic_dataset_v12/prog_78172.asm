; DESCRIPTION: Draws a green line from (490, 53) to (460, 54).
; PLAN: r0=490(x1), r1=53(y1), r2=460(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 53
LDI r2, 460
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
