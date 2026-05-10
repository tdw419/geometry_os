; DESCRIPTION: Places a yellow line segment connecting (74, 104) to (253, 117).
; PLAN: r0=74(x1), r1=104(y1), r2=253(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 104
LDI r2, 253
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
