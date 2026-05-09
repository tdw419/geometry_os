; DESCRIPTION: Places a yellow line segment connecting (202, 74) to (16, 179).
; PLAN: r0=202(x1), r1=74(y1), r2=16(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 74
LDI r2, 16
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
