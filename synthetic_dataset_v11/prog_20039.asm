; DESCRIPTION: Places a yellow line segment connecting (167, 221) to (104, 175).
; PLAN: r0=167(x1), r1=221(y1), r2=104(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 221
LDI r2, 104
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
