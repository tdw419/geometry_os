; DESCRIPTION: Places a yellow line segment connecting (30, 226) to (104, 230).
; PLAN: r0=30(x1), r1=226(y1), r2=104(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 226
LDI r2, 104
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
