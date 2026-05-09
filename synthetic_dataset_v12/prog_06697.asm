; DESCRIPTION: Places a yellow line segment connecting (253, 221) to (268, 1).
; PLAN: r0=253(x1), r1=221(y1), r2=268(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 221
LDI r2, 268
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
