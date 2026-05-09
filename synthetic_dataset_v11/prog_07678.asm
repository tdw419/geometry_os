; DESCRIPTION: Places a black line segment connecting (67, 196) to (87, 65).
; PLAN: r0=67(x1), r1=196(y1), r2=87(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 196
LDI r2, 87
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
