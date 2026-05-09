; DESCRIPTION: Places a yellow line segment connecting (157, 32) to (40, 27).
; PLAN: r0=157(x1), r1=32(y1), r2=40(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 32
LDI r2, 40
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
