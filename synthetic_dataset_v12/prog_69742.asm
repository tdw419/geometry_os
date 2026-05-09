; DESCRIPTION: Draws a yellow line from (460, 131) to (39, 204).
; PLAN: r0=460(x1), r1=131(y1), r2=39(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 131
LDI r2, 39
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
