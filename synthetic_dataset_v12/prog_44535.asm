; DESCRIPTION: Places a black line segment connecting (111, 160) to (406, 202).
; PLAN: r0=111(x1), r1=160(y1), r2=406(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 160
LDI r2, 406
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
