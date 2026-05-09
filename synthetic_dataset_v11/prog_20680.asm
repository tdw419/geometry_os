; DESCRIPTION: Places a yellow line segment connecting (179, 195) to (173, 217).
; PLAN: r0=179(x1), r1=195(y1), r2=173(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 195
LDI r2, 173
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
