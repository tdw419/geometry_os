; DESCRIPTION: Places a black line segment connecting (114, 206) to (434, 217).
; PLAN: r0=114(x1), r1=206(y1), r2=434(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 206
LDI r2, 434
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
