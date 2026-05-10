; DESCRIPTION: Places a yellow line segment connecting (372, 223) to (263, 90).
; PLAN: r0=372(x1), r1=223(y1), r2=263(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 223
LDI r2, 263
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
