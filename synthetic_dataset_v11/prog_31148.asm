; DESCRIPTION: Places a black line segment connecting (123, 6) to (103, 8).
; PLAN: r0=123(x1), r1=6(y1), r2=103(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 6
LDI r2, 103
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
