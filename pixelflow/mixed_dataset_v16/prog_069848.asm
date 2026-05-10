; DESCRIPTION: Places a orange line segment connecting (263, 206) to (451, 57).
; PLAN: r0=263(x1), r1=206(y1), r2=451(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 206
LDI r2, 451
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
