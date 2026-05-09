; DESCRIPTION: Draws a green line from (111, 104) to (24, 230).
; PLAN: r0=111(x1), r1=104(y1), r2=24(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 104
LDI r2, 24
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
