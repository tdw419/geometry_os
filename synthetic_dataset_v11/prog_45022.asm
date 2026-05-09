; DESCRIPTION: Places a black line segment connecting (67, 169) to (42, 173).
; PLAN: r0=67(x1), r1=169(y1), r2=42(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 169
LDI r2, 42
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
