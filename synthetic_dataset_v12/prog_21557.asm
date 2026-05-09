; DESCRIPTION: Places a black line segment connecting (173, 84) to (4, 38).
; PLAN: r0=173(x1), r1=84(y1), r2=4(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 84
LDI r2, 4
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
