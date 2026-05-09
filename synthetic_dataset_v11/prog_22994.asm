; DESCRIPTION: Draws a yellow line from (104, 39) to (52, 158).
; PLAN: r0=104(x1), r1=39(y1), r2=52(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 39
LDI r2, 52
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
