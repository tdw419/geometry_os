; DESCRIPTION: Places a black line segment connecting (471, 143) to (301, 210).
; PLAN: r0=471(x1), r1=143(y1), r2=301(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 143
LDI r2, 301
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
