; DESCRIPTION: Places a orange line segment connecting (371, 152) to (474, 155).
; PLAN: r0=371(x1), r1=152(y1), r2=474(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 152
LDI r2, 474
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
