; DESCRIPTION: Places a yellow line segment connecting (315, 64) to (143, 202).
; PLAN: r0=315(x1), r1=64(y1), r2=143(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 64
LDI r2, 143
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
