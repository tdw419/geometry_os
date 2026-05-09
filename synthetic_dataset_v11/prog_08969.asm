; DESCRIPTION: Places a black line segment connecting (126, 101) to (206, 14).
; PLAN: r0=126(x1), r1=101(y1), r2=206(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 101
LDI r2, 206
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
