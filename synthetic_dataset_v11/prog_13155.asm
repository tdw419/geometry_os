; DESCRIPTION: Places a green line segment connecting (219, 31) to (101, 177).
; PLAN: r0=219(x1), r1=31(y1), r2=101(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 31
LDI r2, 101
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
