; DESCRIPTION: Places a yellow line segment connecting (507, 179) to (128, 96).
; PLAN: r0=507(x1), r1=179(y1), r2=128(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 179
LDI r2, 128
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
