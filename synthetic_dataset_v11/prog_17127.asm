; DESCRIPTION: Places a yellow line segment connecting (183, 129) to (157, 13).
; PLAN: r0=183(x1), r1=129(y1), r2=157(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 129
LDI r2, 157
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
