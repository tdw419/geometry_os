; DESCRIPTION: Places a yellow line segment connecting (28, 199) to (103, 192).
; PLAN: r0=28(x1), r1=199(y1), r2=103(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 199
LDI r2, 103
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
