; DESCRIPTION: Places a white line segment connecting (384, 90) to (390, 235).
; PLAN: r0=384(x1), r1=90(y1), r2=390(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 90
LDI r2, 390
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
