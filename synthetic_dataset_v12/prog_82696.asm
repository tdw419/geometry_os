; DESCRIPTION: Places a yellow line segment connecting (251, 126) to (67, 249).
; PLAN: r0=251(x1), r1=126(y1), r2=67(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 126
LDI r2, 67
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
