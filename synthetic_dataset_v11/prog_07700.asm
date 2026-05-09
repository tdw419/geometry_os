; DESCRIPTION: Places a black line segment connecting (25, 154) to (76, 126).
; PLAN: r0=25(x1), r1=154(y1), r2=76(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 154
LDI r2, 76
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
