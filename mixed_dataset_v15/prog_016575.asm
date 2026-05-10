; DESCRIPTION: Draws a yellow line from (460, 8) to (456, 136).
; PLAN: r0=460(x1), r1=8(y1), r2=456(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 8
LDI r2, 456
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
