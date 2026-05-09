; DESCRIPTION: Places a black line segment connecting (25, 126) to (167, 224).
; PLAN: r0=25(x1), r1=126(y1), r2=167(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 126
LDI r2, 167
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
