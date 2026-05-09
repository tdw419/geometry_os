; DESCRIPTION: Places a black line segment connecting (474, 21) to (382, 126).
; PLAN: r0=474(x1), r1=21(y1), r2=382(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 21
LDI r2, 382
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
