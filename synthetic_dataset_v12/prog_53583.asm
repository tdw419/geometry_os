; DESCRIPTION: Places a black line segment connecting (226, 128) to (253, 68).
; PLAN: r0=226(x1), r1=128(y1), r2=253(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 128
LDI r2, 253
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
