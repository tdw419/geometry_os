; DESCRIPTION: Places a black line segment connecting (208, 133) to (123, 128).
; PLAN: r0=208(x1), r1=133(y1), r2=123(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 133
LDI r2, 123
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
