; DESCRIPTION: Places a black line segment connecting (247, 116) to (255, 172).
; PLAN: r0=247(x1), r1=116(y1), r2=255(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 116
LDI r2, 255
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
