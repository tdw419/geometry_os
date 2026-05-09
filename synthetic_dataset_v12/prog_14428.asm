; DESCRIPTION: Places a black line segment connecting (433, 63) to (510, 176).
; PLAN: r0=433(x1), r1=63(y1), r2=510(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 63
LDI r2, 510
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
