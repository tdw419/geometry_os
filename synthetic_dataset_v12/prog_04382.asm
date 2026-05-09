; DESCRIPTION: Places a yellow line segment connecting (205, 235) to (431, 242).
; PLAN: r0=205(x1), r1=235(y1), r2=431(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 235
LDI r2, 431
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
