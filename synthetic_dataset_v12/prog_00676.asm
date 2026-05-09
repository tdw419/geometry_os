; DESCRIPTION: Places a black line segment connecting (253, 64) to (103, 208).
; PLAN: r0=253(x1), r1=64(y1), r2=103(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 64
LDI r2, 103
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
