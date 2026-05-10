; DESCRIPTION: Places a black line segment connecting (392, 87) to (352, 116).
; PLAN: r0=392(x1), r1=87(y1), r2=352(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 87
LDI r2, 352
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
