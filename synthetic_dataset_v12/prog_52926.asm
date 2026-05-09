; DESCRIPTION: Places a black line segment connecting (262, 128) to (21, 84).
; PLAN: r0=262(x1), r1=128(y1), r2=21(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 128
LDI r2, 21
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
