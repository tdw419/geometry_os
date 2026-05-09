; DESCRIPTION: Draws a yellow line from (289, 158) to (460, 16).
; PLAN: r0=289(x1), r1=158(y1), r2=460(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 158
LDI r2, 460
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
