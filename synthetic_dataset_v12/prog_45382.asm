; DESCRIPTION: Places a yellow line segment connecting (39, 177) to (329, 101).
; PLAN: r0=39(x1), r1=177(y1), r2=329(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 177
LDI r2, 329
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
