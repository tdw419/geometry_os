; DESCRIPTION: Places a black line segment connecting (474, 249) to (115, 172).
; PLAN: r0=474(x1), r1=249(y1), r2=115(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 249
LDI r2, 115
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
