; DESCRIPTION: Places a black line segment connecting (205, 242) to (413, 81).
; PLAN: r0=205(x1), r1=242(y1), r2=413(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 242
LDI r2, 413
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
