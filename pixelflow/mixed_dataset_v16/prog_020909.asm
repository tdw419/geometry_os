; DESCRIPTION: Places a yellow line segment connecting (233, 163) to (263, 107).
; PLAN: r0=233(x1), r1=163(y1), r2=263(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 163
LDI r2, 263
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
