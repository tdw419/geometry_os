; DESCRIPTION: Places a black line segment connecting (276, 177) to (510, 219).
; PLAN: r0=276(x1), r1=177(y1), r2=510(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 177
LDI r2, 510
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
