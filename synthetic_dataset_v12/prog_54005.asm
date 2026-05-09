; DESCRIPTION: Places a black line segment connecting (205, 143) to (173, 71).
; PLAN: r0=205(x1), r1=143(y1), r2=173(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 143
LDI r2, 173
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
