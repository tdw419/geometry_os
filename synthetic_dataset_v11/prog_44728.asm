; DESCRIPTION: Places a yellow line segment connecting (179, 113) to (107, 242).
; PLAN: r0=179(x1), r1=113(y1), r2=107(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 113
LDI r2, 107
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
