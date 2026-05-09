; DESCRIPTION: Places a black line segment connecting (265, 49) to (344, 237).
; PLAN: r0=265(x1), r1=49(y1), r2=344(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 49
LDI r2, 344
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
