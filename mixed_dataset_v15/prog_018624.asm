; DESCRIPTION: Places a orange line segment connecting (424, 152) to (191, 236).
; PLAN: r0=424(x1), r1=152(y1), r2=191(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 152
LDI r2, 191
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
