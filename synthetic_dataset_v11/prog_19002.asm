; DESCRIPTION: Places a black line segment connecting (68, 176) to (38, 48).
; PLAN: r0=68(x1), r1=176(y1), r2=38(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 176
LDI r2, 38
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
