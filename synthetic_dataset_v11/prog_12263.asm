; DESCRIPTION: Places a orange line segment connecting (116, 142) to (242, 178).
; PLAN: r0=116(x1), r1=142(y1), r2=242(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 142
LDI r2, 242
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
