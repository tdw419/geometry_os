; DESCRIPTION: Places a black line segment connecting (474, 39) to (434, 101).
; PLAN: r0=474(x1), r1=39(y1), r2=434(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 39
LDI r2, 434
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
