; DESCRIPTION: Places a black line segment connecting (16, 157) to (399, 208).
; PLAN: r0=16(x1), r1=157(y1), r2=399(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 157
LDI r2, 399
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
